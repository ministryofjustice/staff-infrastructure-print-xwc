admin_password          = "VMdefaultPassword"
admin_user              = "VMdefaultUsername"
automation_account_name = "auto-xwc-core-001"
cloud_agent_vm_details = {
  "vmxwcca01" = {
    availability_zone = ["1"]
    storage_data_disk = {
      type = "Standard_LRS"
      size = "256"
    }
    nic = {
      subnet     = "snet-xwc-core-001"
      ip_address = "10.193.160.16"
    }
    load_balancer = {
      name       = "lbxwcca01"
      ip_address = "10.193.160.15"
    }
    tag_update_class = "Gold1"
    os_disk_type     = "Standard_LRS"
    vm_size          = "Standard_D4_V4"
  },
  "vmxwcca02" = {
    availability_zone = ["2"]
    storage_data_disk = {
      type = "Standard_LRS"
      size = "256"
    }
    nic = {
      subnet     = "snet-xwc-core-001"
      ip_address = "10.193.160.17"
    }
    load_balancer = {
      name       = "lbxwcca01"
      ip_address = "10.193.160.15"
    }
    tag_update_class = "Gold2"
    os_disk_type     = "Standard_LRS"
    vm_size          = "Standard_D4_V4"
  },
  "vmxwctestca01" = {
    availability_zone = ["1"]
    storage_data_disk = {
      type = "Standard_LRS"
      size = "256"
    }
    nic = {
      subnet     = "snet-xwc-test"
      ip_address = "10.193.160.133"
    }
    load_balancer = {
      name       = "lbxwctestca01"
      ip_address = "10.193.160.132"
    }
    tag_update_class = "test"
    os_disk_type     = "Standard_LRS"
    vm_size          = "Standard_D4_V4"
  },
  "vmxwctestca02" = {
    availability_zone = ["2"]
    storage_data_disk = {
      type = "Standard_LRS"
      size = "256"
    }
    nic = {
      subnet     = "snet-xwc-test"
      ip_address = "10.193.160.134"
    }
    load_balancer = {
      name       = "lbxwctestca01"
      ip_address = "10.193.160.132"
    }
    tag_update_class = "test"
    os_disk_type     = "Standard_LRS"
    vm_size          = "Standard_D4_V4"
  },
}
diag_storage_name = "stxwcbootdiag001"
db_names          = ["sqlxwcdm01", "sqlxwctestdm01"]
device_manager_vm_details = {
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
  "vmxwctestdm01" = {
    availability_zone = ["1"]
    storage_data_disk = {
      type = "Standard_LRS"
      size = "256"
    }
    nic = {
      subnet     = "snet-xwc-test"
      ip_address = "10.193.160.136"
    }
    tag_update_class = "test"
    os_disk_type     = "Standard_LRS"
    vm_size          = "Standard_B4ms"
  },
}
environment          = "xwc"
elastic_pool_name    = "xwc-dev-pool"
key_vault_name       = "kv-xwc-coremoj-001"
license_type         = "Windows_Server"
location             = "UK South"
oms_workspace_name   = "log-xwc-core-001"
private_link_subnet  = "snet-xwc-core-001"
recovery_policy_name = "Policy-3-Month-Backup"
recovery_vault_name  = "rsv-xwc-core-001"
resource_group_name  = "rg-xwc-core-001"
sqldb_azuread_administrator = {
  username  = "Mojo-Azure-ManagementGroup-MoJ_Owner"
  object_id = "0484bc5c-7eb4-4e99-8ff6-a67b1afb34b2"
}
sql_server_name = "sqlxwcdmsrv001"
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
vnet_name = "vnet-xwc-core-001"