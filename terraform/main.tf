module "device-manager" {
  source = "../../modules/device-manager"

  admin_user                  = var.admin_user
  admin_password              = var.admin_password
  app_resource_group_name     = azurerm_resource_group.app.name
  automation_account_name     = var.automation_account_name
  core_resource_group_name    = var.core_resource_group_name
  elastic_pool_name           = var.elastic_pool_name
  e_pool_capacity             = var.e_pool_capacity
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
  tags                        = var.tags
  vnet_name                   = var.vnet_name
  connection_policy           = var.connection_policy
}


module "cloud-agent" {
  source = "../../modules/cloud-agent"

  admin_user               = var.admin_user
  admin_password           = var.admin_password
  app_resource_group_name  = azurerm_resource_group.app.name
  automation_account_name  = var.automation_account_name
  core_resource_group_name = var.core_resource_group_name
  diag_storage_name        = var.diag_storage_name
  key_vault_name           = var.key_vault_name
  license_type             = var.license_type
  location                 = var.location
  oms_workspace_name       = var.oms_workspace_name
  recovery_policy_name     = var.recovery_policy_name
  recovery_vault_name      = var.recovery_vault_name
  storage_image_reference  = var.storage_image_reference
  tags                     = var.tags
  vm_details               = var.cloud_agent_vm_details
  vnet_name                = var.vnet_name
}

locals {

  update_date = substr(time_offset.tomorrow.rfc3339, 0, 10)

  common_deployment_details = {
    azurerm_automation_account = var.automation_account_name
    duration                   = 2 # Two hours
    interval                   = 1 # Once every month
    reboot_setting             = "IfRequired"
    scope                      = azurerm_resource_group.app.id
    start_time                 = "${local.update_date}T01:00:00Z"
    time_zone                  = "UTC"
    week_day                   = "Saturday"
    windows_update_types       = "Critical, Security, UpdateRollup, ServicePack, Definition, Updates"
  }

  cloud_agent_details_test = {
    tag_update_class     = "test"
    week_of_the_month    = 1
    update_schedule_name = "${var.environment}-cloud-agent-test"
  }

  cloud_agent_details_1 = {
    tag_update_class     = "Gold1"
    week_of_the_month    = 2
    update_schedule_name = "${var.environment}-cloud-agent-1"
  }

  cloud_agent_details_2 = {
    tag_update_class     = "Gold2"
    week_of_the_month    = 3
    update_schedule_name = "${var.environment}-cloud-agent-2"
  }

  device_manager_details_test = {
    tag_update_class     = "test"
    week_of_the_month    = 1
    update_schedule_name = "${var.environment}-device-manager-test"
  }

  device_manager_details = {
    tag_update_class     = "Gold1"
    week_of_the_month    = 2
    update_schedule_name = "${var.environment}-device-manager"
  }

  schedule = [
    merge(local.common_deployment_details, local.cloud_agent_details_test),
    merge(local.common_deployment_details, local.cloud_agent_details_1),
    merge(local.common_deployment_details, local.cloud_agent_details_2),
    merge(local.common_deployment_details, local.device_manager_details_test),
    merge(local.common_deployment_details, local.device_manager_details),
  ]

}

resource "time_offset" "tomorrow" {
  offset_days = 1
}


resource "azurerm_resource_group" "app" {
  name     = var.app_resource_group_name
  location = var.location
}

resource "azurerm_resource_group_template_deployment" "cloud_agent_update_schedule" {
  for_each            = { for schedule in local.schedule : schedule.update_schedule_name => schedule }
  name                = each.key
  resource_group_name = var.core_resource_group_name
  deployment_mode     = "Incremental"
  template_content    = templatefile("./update_schedule_template.json", each.value)
}