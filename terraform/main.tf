module "device-manager" {
  source = "./modules/device-manager"

  admin_user                  = var.admin_user
  admin_password              = var.admin_password
  automation_account_name     = var.automation_account_name
  elastic_pool_name           = var.elastic_pool_name
  location                    = var.location
  key_vault_name              = var.key_vault_name
  oms_workspace_name          = var.oms_workspace_name
  recovery_policy_name        = var.recovery_policy_name
  recovery_vault_name         = var.recovery_vault_name
  diag_storage_name           = var.diag_storage_name
  vm_details                  = var.device_manager_vm_details
  storage_image_reference     = var.storage_image_reference
  license_type                = var.license_type
  db_names                    = var.db_names
  sqldb_azuread_administrator = var.sqldb_azuread_administrator
  sql_server_administrator    = var.sql_server_administrator
  sql_server_name             = var.sql_server_name
  private_link_subnet         = var.private_link_subnet
  resource_group_name         = var.resource_group_name
  tags                        = var.tags
  vnet_name                   = var.vnet_name
}


module "cloud-agent" {
  source = "./modules/cloud-agent"

  admin_user              = var.admin_user
  admin_password          = var.admin_password
  automation_account_name = var.automation_account_name
  diag_storage_name       = var.diag_storage_name
  key_vault_name          = var.key_vault_name
  license_type            = var.license_type
  location                = var.location
  oms_workspace_name      = var.oms_workspace_name
  recovery_policy_name    = var.recovery_policy_name
  recovery_vault_name     = var.recovery_vault_name
  resource_group_name     = var.resource_group_name
  storage_image_reference = var.storage_image_reference
  tags                    = var.tags
  vm_details              = var.cloud_agent_vm_details
  vnet_name               = var.vnet_name
}
