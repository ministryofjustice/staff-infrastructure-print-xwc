###############
# Note that all the data resources rely on the spoke having already been deployed
##############

data "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
}

data "azurerm_subnet" "subnet" {
  for_each             = toset([for k in data.azurerm_virtual_network.vnet.subnets : k])
  name                 = each.key
  virtual_network_name = var.vnet_name
  resource_group_name  = var.resource_group_name
}

data "azurerm_key_vault" "key_vault" {
  name                = var.key_vault_name
  resource_group_name = var.resource_group_name
}

#reference to keyvault, used for local admin admin_password
data "azurerm_key_vault_secret" "admin_password" {
  name         = var.admin_password
  key_vault_id = data.azurerm_key_vault.key_vault.id
}

#reference to keyvault, used for local admin username
data "azurerm_key_vault_secret" "admin_user" {
  name         = var.admin_user
  key_vault_id = data.azurerm_key_vault.key_vault.id
}

# OMS Workspace
data "azurerm_log_analytics_workspace" "OMS_WORKSPACE" {
  name                = var.oms_workspace_name
  resource_group_name = var.resource_group_name
}

data "azurerm_backup_policy_vm" "VAULT_POLICY" {
  name                = var.recovery_policy_name
  recovery_vault_name = var.recovery_vault_name
  resource_group_name = var.resource_group_name
}

data "azurerm_storage_account" "BOOT_DIAG" {
  name                = var.diag_storage_name
  resource_group_name = var.resource_group_name
}
