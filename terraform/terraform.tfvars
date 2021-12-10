admin_password          = "VMdefaultPassword"
admin_user              = "VMdefaultUsername"
automation_account_name = "auto-xwc-core-001"
diag_storage_name       = "stxwcbootdiag001"
db_names                = ["sqlxwcdm01", "sqlxwcdm02", "sqlxwcdm03", "sqlxwcdm04", "sqlxwctestdm01"]
environment             = "xwc"
key_vault_name          = "kv-xwc-coremoj-001"
license_type            = "Windows_Server"
location                = "UK South"
oms_workspace_name      = "log-xwc-core-001"
private_link_subnet     = "snet-xwc-core-001"
recovery_policy_name    = "Policy-3-Month-Backup"
recovery_vault_name     = "rsv-xwc-core-001"
resource_group_name     = "rg-xwc-core-001"
sqldb_azuread_administrator = {
  username  = "Mojo-Azure-ManagementGroup-MoJ_Owner"
  object_id = "0484bc5c-7eb4-4e99-8ff6-a67b1afb34b2"
}
sql_server_name = "sqlxwcdmsrv01"
storage_image_reference = {
  publisher = "MicrosoftWindowsServer"
  offer     = "WindowsServer"
  sku       = "2019-datacenter-gensecond"
  version   = "latest"
}
subscription_id = "4b068872-d9f3-41bc-9c34-ffac17cf96d6"
tags = {
  ApplicationName  = "VelocityLandingZone"
  BusinessUnit     = "MOJ"
  CostCentre       = "MOJ"
  OwnerName        = "rob.ashworth@justice.gov.uk"
  ServiceLevel     = "Gold"
  ProjectStartDate = "05102020"
  RequesterName    = "rob.ashworth@justice.gov.uk"
}
tenant_id = "0bb413d7-160d-4839-868a-f3d46537f6af"
vm_details = {
  "vmxwcdm01" = {
    availability_zone = ["1"]
    storage_data_disk = {
      type = "Premium_LRS"
      size = "256"
    }
    nic = {
      subnet     = "snet-xwc-core-001"
      ip_address = "10.193.160.4"
    }
    tag_update_class = "Gold1"
    os_disk_type     = "Premium_LRS"
    vm_size          = "Standard_D8s_V4"
  },
  "vmxwcdm02" = {
    availability_zone = ["2"]
    storage_data_disk = {
      type = "Premium_LRS"
      size = "256"
    }
    nic = {
      subnet     = "snet-xwc-core-001"
      ip_address = "10.193.160.5"
    }
    tag_update_class = "Gold1"
    os_disk_type     = "Premium_LRS"
    vm_size          = "Standard_D8s_V4"
  },
  "vmxwcdm03" = {
    availability_zone = ["3"]
    storage_data_disk = {
      type = "Premium_LRS"
      size = "256"
    }
    nic = {
      subnet     = "snet-xwc-core-001"
      ip_address = "10.193.160.6"
    }
    tag_update_class = "Gold1"
    os_disk_type     = "Premium_LRS"
    vm_size          = "Standard_D8s_V4"
  },
  "vmxwcdm04" = {
    availability_zone = ["1"]
    storage_data_disk = {
      type = "Premium_LRS"
      size = "256"
    }
    nic = {
      subnet     = "snet-xwc-core-001"
      ip_address = "10.193.160.7"
    }
    tag_update_class = "Gold1"
    os_disk_type     = "Premium_LRS"
    vm_size          = "Standard_D8s_V4"
  },
  "vmxwctestdm01" = {
    availability_zone = ["1"]
    storage_data_disk = {
      type = "Standard_LRS"
      size = "256"
    }
    nic = {
      subnet     = "snet-xwc-test"
      ip_address = "10.193.160.132"
    }
    tag_update_class = "Gold2"
    os_disk_type     = "Standard_LRS"
    vm_size          = "Standard_B4ms"
  },
}
vnet_name = "vnet-xwc-core-001"

occurrence = 2
weekDays   = ["Tuesday"]



