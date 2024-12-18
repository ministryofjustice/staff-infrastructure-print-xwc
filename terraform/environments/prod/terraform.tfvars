###############

value_txt_record = "XWC.OfflineMode.Enabled=FALSE" #"FALSE" #change this to change the txt record value for record for offlinemode.print.internal.xcp 

################
admin_password           = "VMdefaultPassword"
admin_user               = "VMdefaultUsername"
app_resource_group_name  = "rg-xwc-app-001"
automation_account_name  = "auto-xwc-core-001"
core_resource_group_name = "rg-xwc-core-001"
cloud_agent_vm_details = {
  "vmxwcca01" = {
    availability_zone = ["1"]
    storage_data_disk = {
      type = "Standard_LRS"
      size = "256"
    }
    nic = {
      subnet     = "snet-xwc-core-001"
      ip_address = "10.192.30.5"
    }
    load_balancer = {
      name       = "lbxwcca01"
      ip_address = "10.192.30.4"
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
      ip_address = "10.192.30.6"
    }
    load_balancer = {
      name       = "lbxwcca01"
      ip_address = "10.192.30.4"
    }
    tag_update_class = "Gold2"
    os_disk_type     = "Standard_LRS"
    vm_size          = "Standard_D4_V4"
  },
  "vmxwcca03" = {
    availability_zone = ["3"]
    storage_data_disk = {
      type = "Standard_LRS"
      size = "256"
    }
    nic = {
      subnet     = "snet-xwc-core-001"
      ip_address = "10.192.30.8"
    }
    load_balancer = {
      name       = "lbxwcca02"
      ip_address = "10.192.30.7"
    }
    tag_update_class = "Gold1"
    os_disk_type     = "Standard_LRS"
    vm_size          = "Standard_D4_V4"
  },
  "vmxwcca04" = {
    availability_zone = ["1"]
    storage_data_disk = {
      type = "Standard_LRS"
      size = "256"
    }
    nic = {
      subnet     = "snet-xwc-core-001"
      ip_address = "10.192.30.9"
    }
    load_balancer = {
      name       = "lbxwcca02"
      ip_address = "10.192.30.7"
    }
    tag_update_class = "Gold2"
    os_disk_type     = "Standard_LRS"
    vm_size          = "Standard_D4_V4"
  },
  "vmxwcca05" = {
    availability_zone = ["2"]
    storage_data_disk = {
      type = "Standard_LRS"
      size = "256"
    }
    nic = {
      subnet     = "snet-xwc-core-001"
      ip_address = "10.192.30.11"
    }
    load_balancer = {
      name       = "lbxwcca03"
      ip_address = "10.192.30.10"
    }
    tag_update_class = "Gold1"
    os_disk_type     = "Standard_LRS"
    vm_size          = "Standard_D4_V4"
  },
  "vmxwcca06" = {
    availability_zone = ["3"]
    storage_data_disk = {
      type = "Standard_LRS"
      size = "256"
    }
    nic = {
      subnet     = "snet-xwc-core-001"
      ip_address = "10.192.30.12"
    }
    load_balancer = {
      name       = "lbxwcca03"
      ip_address = "10.192.30.10"
    }
    tag_update_class = "Gold2"
    os_disk_type     = "Standard_LRS"
    vm_size          = "Standard_D4_V4"
  },
  "vmxwcca07" = {
    availability_zone = ["1"]
    storage_data_disk = {
      type = "Standard_LRS"
      size = "256"
    }
    nic = {
      subnet     = "snet-xwc-core-001"
      ip_address = "10.192.30.14"
    }
    load_balancer = {
      name       = "lbxwcca04"
      ip_address = "10.192.30.13"
    }
    tag_update_class = "Gold1"
    os_disk_type     = "Standard_LRS"
    vm_size          = "Standard_D4_V4"
  },
  "vmxwcca08" = {
    availability_zone = ["2"]
    storage_data_disk = {
      type = "Standard_LRS"
      size = "256"
    }
    nic = {
      subnet     = "snet-xwc-core-001"
      ip_address = "10.192.30.15"
    }
    load_balancer = {
      name       = "lbxwcca04"
      ip_address = "10.192.30.13"
    }
    tag_update_class = "Gold2"
    os_disk_type     = "Standard_LRS"
    vm_size          = "Standard_D4_V4"
  },
  "vmxwcca09" = {
    availability_zone = ["2"]
    storage_data_disk = {
      type = "Standard_LRS"
      size = "256"
    }
    nic = {
      subnet     = "snet-xwc-core-001"
      ip_address = "10.192.30.17"
    }
    load_balancer = {
      name       = "lbxwcca05"
      ip_address = "10.192.30.16"
    }
    tag_update_class = "Gold1"
    os_disk_type     = "Standard_LRS"
    vm_size          = "Standard_D4_V4"
  },
  "vmxwcca10" = {
    availability_zone = ["3"]
    storage_data_disk = {
      type = "Standard_LRS"
      size = "256"
    }
    nic = {
      subnet     = "snet-xwc-core-001"
      ip_address = "10.192.30.18"
    }
    load_balancer = {
      name       = "lbxwcca05"
      ip_address = "10.192.30.16"
    }
    tag_update_class = "Gold2"
    os_disk_type     = "Standard_LRS"
    vm_size          = "Standard_D4_V4"
  },
  "vmxwcca11" = {
    availability_zone = ["1"]
    storage_data_disk = {
      type = "Standard_LRS"
      size = "256"
    }
    nic = {
      subnet     = "snet-xwc-core-001"
      ip_address = "10.192.30.20"
    }
    load_balancer = {
      name       = "lbxwcca06"
      ip_address = "10.192.30.19"
    }
    tag_update_class = "Gold1"
    os_disk_type     = "Standard_LRS"
    vm_size          = "Standard_D4_V4"
  },
  "vmxwcca12" = {
    availability_zone = ["2"]
    storage_data_disk = {
      type = "Standard_LRS"
      size = "256"
    }
    nic = {
      subnet     = "snet-xwc-core-001"
      ip_address = "10.192.30.21"
    }
    load_balancer = {
      name       = "lbxwcca06"
      ip_address = "10.192.30.19"
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
      ip_address = "10.192.30.133"
    }
    load_balancer = {
      name       = "lbxwctestca01"
      ip_address = "10.192.30.132"
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
      ip_address = "10.192.30.134"
    }
    load_balancer = {
      name       = "lbxwctestca01"
      ip_address = ""
    }
    tag_update_class = "test"
    os_disk_type     = "Standard_LRS"
    vm_size          = "Standard_D4_V4"
  },
}
diag_storage_name = "stxwcbootdiag003"
db_names          = ["sqlxwcdm01", "sqlxwcdm02", "sqlxwcdm03", "sqlxwcdm04", "sqlxwctestdm01"]
device_manager_vm_details = {
  "vmxwcdm01" = {
    availability_zone = ["1"]
    storage_data_disk = {
      type = "Premium_LRS"
      size = "256"
    }
    nic = {
      subnet     = "snet-xwc-core-001"
      ip_address = "10.192.30.30"
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
      ip_address = "10.192.30.31"
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
      ip_address = "10.192.30.32"
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
      ip_address = "10.192.30.33"
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
      subnet               = "snet-xwc-test"
      ip_address           = "10.192.30.135"
      public_ip_address_id = "/subscriptions/876eef88-ec3d-47db-b101-ec6f9daefb65/resourceGroups/rg-xwc-app-001/providers/Microsoft.Network/publicIPAddresses/pip-xwc"
    }
    tag_update_class = "test"
    os_disk_type     = "Standard_LRS"
    vm_size          = "Standard_B4ms"
  },
}
environment          = "xwc"
elastic_pool_name    = "xwc-prod-pool"
e_pool_capacity      = 200
key_vault_name       = "kv-xwc-coremoj-003"
license_type         = "Windows_Server"
location             = "UK South"
oms_workspace_name   = "log-xwc-core-003"
private_link_subnet  = "snet-xwc-core-001"
recovery_policy_name = "Policy-3-Month-Backup"
recovery_vault_name  = "rsv-xwc-core-001"
sqldb_azuread_administrator = {
  username  = "Mojo-Azure-ManagementGroup-MoJ_Owner"
  object_id = "0484bc5c-7eb4-4e99-8ff6-a67b1afb34b2"
}
sql_server_name = "sqlxwcdmsrv003"
storage_image_reference = {
  publisher = "MicrosoftWindowsServer"
  offer     = "WindowsServer"
  sku       = "2019-datacenter-gensecond"
  version   = "latest"
}
subscription_id = "876eef88-ec3d-47db-b101-ec6f9daefb65"
tags = {
  ApplicationName  = "VelocityLandingZone"
  BusinessUnit     = "MOJ"
  CostCentre       = "MOJ"
  OwnerName        = "rob.ashworth@justice.gov.uk"
  ServiceLevel     = "Gold"
  ProjectStartDate = "05102020"
  RequesterName    = "rob.ashworth@justice.gov.uk"
}
tenant_id             = "c6874728-71e6-41fe-a9e1-2e8c36776ad8"
vnet_name             = "vnet-xwc-core-001"
connection_policy     = "Redirect"
database_min_capacity = 20
database_max_capacity = 50

resource_group_vms         ="rg-xwc-app-001"
resource_group_dcr         = "rg-xwc-core-001"
log_analytics_workspace_id ="/subscriptions/876eef88-ec3d-47db-b101-ec6f9daefb65/resourceGroups/rg-xwc-core-001/providers/Microsoft.OperationalInsights/workspaces/log-xwc-core-003"