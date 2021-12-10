environment     = "xwc"
tenant_id       = "0bb413d7-160d-4839-868a-f3d46537f6af"
subscription_id = "4b068872-d9f3-41bc-9c34-ffac17cf96d6"
suffix          = "01"
automation_account_name = "auto-xwc-core-001"
key_vault_name = "kv-xwc-coremoj-001"
account_tier                           = "Standard"
account_kind                           = "StorageV2"
account_replication_type               = "GRS"
enable_https_traffic_only              = true
location                               = "UK South"
subnet_name                            = "snet-xwc-core-001"
subresource_names                      = ["table"]
resource_group_name                    = "rg-xwc-core-001"
tags = {
  ApplicationName  = "VelocityLandingZone"
  BusinessUnit     = "MOJ"
  CostCentre       = "MOJ"
  OwnerName        = "rob.ashworth@justice.gov.uk"
  ServiceLevel     = "Gold"
  ProjectStartDate = "05102020"
  RequesterName    = "rob.ashworth@justice.gov.uk"
}
vnet_name                = "vnet-xwc-core-001"
admin_user             = "VMdefaultUsername"
admin_password         = "VMdefaultPassword"
oms_workspace_name      = "log-xwc-core-001"
recovery_policy_name    = "Policy-3-Month-Backup"
recovery_vault_name     = "rsv-xwc-core-001"
diag_storage_name     = "stxwcbootdiag001"
vm_details = {
"vmxwcdm01" = {
  availability_zone = ["1"]
  storage_data_disk = {
     type = "Premium_LRS"
     size = "256"
    }
  license_type = "Windows_Server"
  nic = {
    name = "nic1-vmxwcdm01"
    ip_address = "10.193.160.4"
   }
  storage_image_reference={
     publisher             = "MicrosoftWindowsServer"
     offer                 = "WindowsServer"
     sku                   = "2019-datacenter-gensecond"
     version               = "latest"
    }
    tag_update_class = "Bronze1"
    os_disk_type = "Premium_LRS"
    vm_size = "Standard_D8s_V4"
  }

  }

occurrence            = 2
weekDays              = ["Tuesday"]



