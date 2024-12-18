resource "azurerm_monitor_data_collection_rule" "change_tracking_data_collection_rule" {
  name                = "dcr-changetracking"
  resource_group_name = var.resource_group_dcr
  location            = var.location
  provider            = azurerm.spoke

  data_sources {
    extension {
      name           = "CTDataSource-Windows"
      extension_name = "ChangeTracking-Windows"
      streams = [
        "Microsoft-ConfigurationChange",
        "Microsoft-ConfigurationChangeV2",
        "Microsoft-ConfigurationData"
      ]
      # Default CT configuration for Windows
      extension_json = <<JSON
        {
          "enableFiles": true,
          "enableSoftware": true,
          "enableRegistry": true,
          "enableServices": true,
          "enableInventory": true,
          "registrySettings": {
            "registryCollectionFrequency": 3000,
            "registryInfo": [
              {
                "name": "Registry_1",
                "groupTag": "Recommended",
                "enabled": false,
                "recurse": true,
                "description": "",
                "keyName": "HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows\\CurrentVersion\\Group Policy\\Scripts\\Startup",
                "valueName": ""
              },
              {
                "name": "Registry_2",
                "groupTag": "Recommended",
                "enabled": false,
                "recurse": true,
                "description": "",
                "keyName": "HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows\\CurrentVersion\\Group Policy\\Scripts\\Shutdown",
                "valueName": ""
              },
              {
                "name": "Registry_3",
                "groupTag": "Recommended",
                "enabled": false,
                "recurse": true,
                "description": "",
                "keyName": "HKEY_LOCAL_MACHINE\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Run",
                "valueName": ""
              },
              {
                "name": "Registry_4",
                "groupTag": "Recommended",
                "enabled": false,
                "recurse": true,
                "description": "",
                "keyName": "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Active Setup\\Installed Components",
                "valueName": ""
              },
              {
                "name": "Registry_5",
                "groupTag": "Recommended",
                "enabled": false,
                "recurse": true,
                "description": "",
                "keyName": "HKEY_LOCAL_MACHINE\\Software\\Classes\\Directory\\ShellEx\\ContextMenuHandlers",
                "valueName": ""
              },
              {
                "name": "Registry_6",
                "groupTag": "Recommended",
                "enabled": false,
                "recurse": true,
                "description": "",
                "keyName": "HKEY_LOCAL_MACHINE\\Software\\Classes\\Directory\\Background\\ShellEx\\ContextMenuHandlers",
                "valueName": ""
              },
              {
                "name": "Registry_7",
                "groupTag": "Recommended",
                "enabled": false,
                "recurse": true,
                "description": "",
                "keyName": "HKEY_LOCAL_MACHINE\\Software\\Classes\\Directory\\Shellex\\CopyHookHandlers",
                "valueName": ""
              },
              {
                "name": "Registry_8",
                "groupTag": "Recommended",
                "enabled": false,
                "recurse": true,
                "description": "",
                "keyName": "HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\ShellIconOverlayIdentifiers",
                "valueName": ""
              },
              {
                "name": "Registry_9",
                "groupTag": "Recommended",
                "enabled": false,
                "recurse": true,
                "description": "",
                "keyName": "HKEY_LOCAL_MACHINE\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Explorer\\ShellIconOverlayIdentifiers",
                "valueName": ""
              },
              {
                "name": "Registry_10",
                "groupTag": "Recommended",
                "enabled": false,
                "recurse": true,
                "description": "",
                "keyName": "HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Browser Helper Objects",
                "valueName": ""
              },
              {
                "name": "Registry_11",
                "groupTag": "Recommended",
                "enabled": false,
                "recurse": true,
                "description": "",
                "keyName": "HKEY_LOCAL_MACHINE\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Browser Helper Objects",
                "valueName": ""
              },
              {
                "name": "Registry_12",
                "groupTag": "Recommended",
                "enabled": false,
                "recurse": true,
                "description": "",
                "keyName": "HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Internet Explorer\\Extensions",
                "valueName": ""
              },
              {
                "name": "Registry_13",
                "groupTag": "Recommended",
                "enabled": false,
                "recurse": true,
                "description": "",
                "keyName": "HKEY_LOCAL_MACHINE\\Software\\Wow6432Node\\Microsoft\\Internet Explorer\\Extensions",
                "valueName": ""
              },
              {
                "name": "Registry_14",
                "groupTag": "Recommended",
                "enabled": false,
                "recurse": true,
                "description": "",
                "keyName": "HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Drivers32",
                "valueName": ""
              },
              {
                "name": "Registry_15",
                "groupTag": "Recommended",
                "enabled": false,
                "recurse": true,
                "description": "",
                "keyName": "HKEY_LOCAL_MACHINE\\Software\\Wow6432Node\\Microsoft\\Windows NT\\CurrentVersion\\Drivers32",
                "valueName": ""
              },
              {
                "name": "Registry_16",
                "groupTag": "Recommended",
                "enabled": false,
                "recurse": true,
                "description": "",
                "keyName": "HKEY_LOCAL_MACHINE\\System\\CurrentControlSet\\Control\\Session Manager\\KnownDlls",
                "valueName": ""
              },
              {
                "name": "Registry_17",
                "groupTag": "Recommended",
                "enabled": false,
                "recurse": true,
                "description": "",
                "keyName": "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon\\Notify",
                "valueName": ""
              }
            ]
          },
          "fileSettings": {
            "fileCollectionFrequency": 2700
          },
          "softwareSettings": {
            "softwareCollectionFrequency": 1800
          },
          "inventorySettings": {
            "inventoryCollectionFrequency": 36000
          },
          "servicesSettings": {
            "serviceCollectionFrequency": 1800
          }
        }
      JSON
    }
    extension {
      name           = "CTDataSource-Linux"
      extension_name = "ChangeTracking-Linux"
      streams = [
        "Microsoft-ConfigurationChange",
        "Microsoft-ConfigurationChangeV2",
        "Microsoft-ConfigurationData"
      ]
      # Default CT configuration for Linux
      extension_json = <<JSON
        {
          "enableFiles": true,
          "enableSoftware": true,
          "enableRegistry": false,
          "enableServices": true,
          "enableInventory": true,
          "fileSettings": {
            "fileCollectionFrequency": 900,
            "fileInfo": [
              {
                "name": "ChangeTrackingLinuxPath_default",
                "enabled": true,
                "destinationPath": "/etc/.*.conf",
                "useSudo": true,
                "recurse": true,
                "maxContentsReturnable": 5000000,
                "pathType": "File",
                "type": "File",
                "links": "Follow",
                "maxOutputSize": 500000,
                "groupTag": "Recommended"
              }
            ]
          },
          "softwareSettings": {
            "softwareCollectionFrequency": 300
          },
          "inventorySettings": {
            "inventoryCollectionFrequency": 36000
          },
          "servicesSettings": {
            "serviceCollectionFrequency": 300
          }
        }
      JSON
    }
  }

  data_flow {
    streams = [
      "Microsoft-ConfigurationChange",
      "Microsoft-ConfigurationChangeV2",
      "Microsoft-ConfigurationData"
    ]
    destinations = [
      "Microsoft-CT-Dest"
    ]
  }

  destinations {
    log_analytics {
      workspace_resource_id = var.log_analytics_workspace_id
      name                  = "Microsoft-CT-Dest"
    }
  }
  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}
data "azurerm_virtual_machine" "vmxwctestca01" {
  provider            = azurerm.spoke
  name                = "vmxwctestca01"
  resource_group_name = var.resource_group_vms

}
data "azurerm_virtual_machine" "vmxwctestca02" {
  provider            = azurerm.spoke
  name                = "vmxwctestca02"
  resource_group_name = var.resource_group_vms

}
data "azurerm_virtual_machine" "vmxwctestdm01" {
  provider            = azurerm.spoke
  name                = "vmxwctestdm01"
  resource_group_name = var.resource_group_vms
}

resource "azurerm_resource_policy_assignment" "Enablechangetracking-vmxwctestca01" {
  provider             = azurerm.spoke
  name                 = "Enable ChangeTracking and Inventory for vmxwctestca01"
  resource_id          = data.azurerm_virtual_machine.vmxwctestca01.id
  policy_definition_id = "/providers/Microsoft.Authorization/policySetDefinitions/92a36f05-ebc9-4bba-9128-b47ad2ea3354"
  location             = var.location

  identity {
    type = "SystemAssigned"
  }
  parameters = jsonencode({
    bringYourOwnUserAssignedManagedIdentity = {
      value = false
    }
    dcrResourceId = {
      value = azurerm_monitor_data_collection_rule.change_tracking_data_collection_rule.id
    }
  })
}
resource "azurerm_resource_policy_assignment" "Enablechangetracking-vmxwctestca02" {
  provider             = azurerm.spoke
  name                 = "Enable ChangeTracking and Inventory for vmxwctestca02"
  resource_id          = data.azurerm_virtual_machine.vmxwctestca02.id
  policy_definition_id = "/providers/Microsoft.Authorization/policySetDefinitions/92a36f05-ebc9-4bba-9128-b47ad2ea3354"
  location             = var.location

  identity {
    type = "SystemAssigned"
  }
  parameters = jsonencode({
    bringYourOwnUserAssignedManagedIdentity = {
      value = false
    }
    dcrResourceId = {
      value = azurerm_monitor_data_collection_rule.change_tracking_data_collection_rule.id
    }
  })
}
resource "azurerm_resource_policy_assignment" "Enablechangetracking-vmxwctestdm01" {
  provider             = azurerm.spoke
  name                 = "Enable ChangeTracking and Inventory for vmxwctestdm01"
  resource_id          = data.azurerm_virtual_machine.vmxwctestdm01.id
  policy_definition_id = "/providers/Microsoft.Authorization/policySetDefinitions/92a36f05-ebc9-4bba-9128-b47ad2ea3354"
  location             = var.location

  identity {
    type = "SystemAssigned"
  }
  parameters = jsonencode({
    bringYourOwnUserAssignedManagedIdentity = {
      value = false
    }
    dcrResourceId = {
      value = azurerm_monitor_data_collection_rule.change_tracking_data_collection_rule.id
    }
  })
}
resource "azurerm_resource_policy_exemption" "BuiltInUserAssignedManagedIdentity_vmxwctestca01" {
  name                            = "exempt UserAssignedManagedIdentity vmxwctestca01"
  resource_id                     = data.azurerm_virtual_machine.vmxwctestca01.id
  policy_assignment_id            = azurerm_resource_policy_assignment.Enablechangetracking-vmxwctestca01.id
  policy_definition_reference_ids = ["AddUserAssignedManagedIdentity_VM"]
  exemption_category              = "Waiver"
}
resource "azurerm_resource_policy_exemption" "BuiltInUserAssignedManagedIdentity_vmxwctestca02" {
  name                            = "exempt UserAssignedManagedIdentity to vmxwctestca02"
  resource_id                     = data.azurerm_virtual_machine.vmxwctestca02.id
  policy_assignment_id            = azurerm_resource_policy_assignment.Enablechangetracking-vmxwctestca02.id
  policy_definition_reference_ids = ["AddUserAssignedManagedIdentity_VM"]
  exemption_category              = "Waiver"
}
resource "azurerm_resource_policy_exemption" "BuiltInUserAssignedManagedIdentity_vmxwctestdm01" {
  name                            = "exempt UserAssignedManagedIdentity to vmxwctestdm01"
  resource_id                     = data.azurerm_virtual_machine.vmxwctestdm01.id
  policy_assignment_id            = azurerm_resource_policy_assignment.Enablechangetracking-vmxwctestdm01.id
  policy_definition_reference_ids = ["AddUserAssignedManagedIdentity_VM"]
  exemption_category              = "Waiver"
}
resource "azurerm_role_assignment" "Policy_ChangeTracking_Contributor_vmxwctestca01" {
  provider             = azurerm.spoke
  scope                = var.resource_group_vms
  role_definition_name = "Contributor"
  principal_id         = azurerm_resource_policy_assignment.Enablechangetracking-vmxwctestca01.identity[0].principal_id
}
resource "azurerm_role_assignment" "Policy_ChangeTracking_Contributor_vmxwctestca02" {
  provider             = azurerm.spoke
  scope                = var.resource_group_vms
  role_definition_name = "Contributor"
  principal_id         = azurerm_resource_policy_assignment.Enablechangetracking-vmxwctestca02.identity[0].principal_id
}
resource "azurerm_role_assignment" "Policy_ChangeTracking_Contributor_vmxwctestdm01" {
  provider             = azurerm.spoke
  scope                = var.resource_group_vms
  role_definition_name = "Contributor"
  principal_id         = azurerm_resource_policy_assignment.Enablechangetracking-vmxwctestdm01.identity[0].principal_id
}
resource "azurerm_role_assignment" "Policy_ChangeTracking_rg-xwc-core-001_Contributor-vmxwctestca01" {
  provider             = azurerm.spoke
  scope                = var.resource_group_dcr
  role_definition_name = "Contributor"
  principal_id         = azurerm_resource_policy_assignment.Enablechangetracking-vmxwctestca01.identity[0].principal_id
}
resource "azurerm_role_assignment" "Policy_ChangeTracking_rg-xwc-core-001_Contributor_vmxwctestca02" {
  provider             = azurerm.spoke
  scope                = var.resource_group_dcr
  role_definition_name = "Contributor"
  principal_id         = azurerm_resource_policy_assignment.Enablechangetracking-vmxwctestca02.identity[0].principal_id
}
resource "azurerm_role_assignment" "Policy_ChangeTracking_rg-xwc-core-001_Contributor_vmxwctestdm01" {
  provider             = azurerm.spoke
  scope                = var.resource_group_dcr
  role_definition_name = "Contributor"
  principal_id         = azurerm_resource_policy_assignment.Enablechangetracking-vmxwctestdm01.identity[0].principal_id
}