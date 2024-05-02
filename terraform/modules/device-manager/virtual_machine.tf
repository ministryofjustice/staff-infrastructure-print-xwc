# Deploy NICs
resource "azurerm_network_interface" "NIC" {
  for_each            = var.vm_details
  name                = "nic1-${each.key}"
  location            = var.location
  resource_group_name = var.app_resource_group_name
  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = data.azurerm_subnet.subnet[each.value.nic.subnet].id
    private_ip_address_allocation = "Static"
    private_ip_address            = each.value.nic.ip_address
    public_ip_address_id          = each.value.nic.public_ip_address_id != null ? each.value.nic.public_ip_address_id : null
  }

  tags = var.tags #This is to avoid terraform plan issues as the tags are applied by policy
}


# Deploy Virtual Machine
resource "azurerm_virtual_machine" "VM" {
  for_each              = var.vm_details
  name                  = each.key
  location              = var.location
  resource_group_name   = var.app_resource_group_name
  network_interface_ids = [azurerm_network_interface.NIC[each.key].id]
  vm_size               = each.value.vm_size
  license_type          = var.license_type

  zones = each.value.availability_zone

  storage_image_reference {
    publisher = var.storage_image_reference.publisher
    offer     = var.storage_image_reference.offer
    sku       = var.storage_image_reference.sku
    version   = var.storage_image_reference.version
  }

  boot_diagnostics {
    enabled     = true
    storage_uri = data.azurerm_storage_account.BOOT_DIAG.primary_blob_endpoint
  }

  storage_os_disk {
    name              = format("os-%s", each.key)
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = each.value.os_disk_type
  }

  storage_data_disk {
    name              = format("data-%s", each.key)
    create_option     = "Empty"
    lun               = 0
    disk_size_gb      = each.value.storage_data_disk.size
    managed_disk_type = each.value.storage_data_disk.type
  }

  os_profile {
    computer_name  = each.key
    admin_username = data.azurerm_key_vault_secret.admin_user.value
    admin_password = data.azurerm_key_vault_secret.admin_password.value
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }

  identity {
    type = "SystemAssigned"
  }

  tags = merge(var.tags, { "UpdateClass" = each.value.tag_update_class })

}


resource "azurerm_virtual_machine_extension" "AVEXT" {
  for_each                   = var.vm_details
  name                       = "IaaSAntimalware"
  virtual_machine_id         = azurerm_virtual_machine.VM[each.key].id
  publisher                  = "Microsoft.Azure.Security"
  type                       = "IaaSAntimalware"
  type_handler_version       = "1.1"
  auto_upgrade_minor_version = "true"

  settings = <<SETTINGS
  {
    "AntimalwareEnabled": true,
    "RealtimeProtectionEnabled": "true",
    "ScheduledScanSettings": {
        "isEnabled": "true",
        "day": "7",
        "time": "120",
        "scanType": "Quick"
    },
    "Exclusions": {
        "Extensions": "",
        "Paths": "C:\\Windows\\SoftwareDistribution\\Datastore;C:\\Windows\\SoftwareDistribution\\Datastore\\Logs;C:\\Windows\\Security\\Database",
        "Processes": "NTUser.dat*"
     }
  }
  SETTINGS
  tags     = var.tags #This is to avoid terraform plan issues as the tags are applied by policy
}


resource "azurerm_virtual_machine_extension" "OMSAGENT" {
  for_each                   = var.vm_details
  name                       = "MicrosoftMonitoringAgent"
  virtual_machine_id         = azurerm_virtual_machine.VM[each.key].id
  publisher                  = "Microsoft.EnterpriseCloud.Monitoring"
  type                       = "MicrosoftMonitoringAgent"
  type_handler_version       = "1.0"
  auto_upgrade_minor_version = true

  settings = <<-BASE_SETTINGS
  {
    "azureResourceId" : "${azurerm_virtual_machine.VM[each.key].id}",
    "stopOnMultipleConnections" : true,
    "workspaceId" : "${data.azurerm_log_analytics_workspace.OMS_WORKSPACE.workspace_id}"
  }
  BASE_SETTINGS

  protected_settings = <<-PROTECTED_SETTINGS
  {
    "workspaceKey" : "${data.azurerm_log_analytics_workspace.OMS_WORKSPACE.primary_shared_key}"
  }
  PROTECTED_SETTINGS

  tags = var.tags #This is to avoid terraform plan issues as the tags are applied by policy
}

resource "azurerm_virtual_machine_extension" "login_for_windows" {
  for_each                   = var.vm_details
  name                       = "AADLoginForWindows"
  virtual_machine_id         = azurerm_virtual_machine.VM[each.key].id
  type                       = "AADLoginForWindows"
  type_handler_version       = "1.0"
  auto_upgrade_minor_version = true
  publisher                  = "Microsoft.Azure.ActiveDirectory"
  tags                       = var.tags #This is to avoid terraform plan issues as the tags are applied by policy
}


# Backup recovery services
resource "azurerm_backup_protected_vm" "VM_VAULT" {
  for_each            = var.vm_details
  resource_group_name = var.core_resource_group_name
  recovery_vault_name = var.recovery_vault_name
  backup_policy_id    = data.azurerm_backup_policy_vm.VAULT_POLICY.id
  source_vm_id        = azurerm_virtual_machine.VM[each.key].id
}


#####
# This block is to account for the additional data disk forthe vmxwctestdm01 server-this is only in prod
#####

resource "azurerm_virtual_machine_data_disk_attachment" "additional_disk" {
  count = contains(keys(var.vm_details), "vmxwctestdm01") && var.subscription_id == "876eef88-ec3d-47db-b101-ec6f9daefb65" ? 1 : 0

  virtual_machine_id = azurerm_virtual_machine.VM["vmxwctestdm01"].id
  lun                = 1
  caching            = "None"
  create_option      = "Attach"
  managed_disk_id    = "/subscriptions/876eef88-ec3d-47db-b101-ec6f9daefb65/resourceGroups/RG-XWC-APP-001/providers/Microsoft.Compute/disks/data-vmxwctestdm01-20240313_010551"

  depends_on = [
    azurerm_virtual_machine.VM["vmxwctestdm01"]
  ]
}