resource "time_offset" "tomorrow" {
  offset_days = 1
}

data "azurerm_resource_group" "group" {
  name = var.resource_group_name
}

locals{

    common_deployment_details ={
        azurerm_automation_account = var.automation_account_name
        duration = 2
        interval = 1
        reboot_setting = "IfRequired"
        scope = data.azurerm_resource_group.group.id
        time_zone = "UTC"
        update_schedule_name = var.update_schedule_name
        windows_update_types =  "Critical, Security, UpdateRollup, ServicePack, Definition, Updates"
    }

  cloud_agent_details = {
      start_time = time_offset.tomorrow.rfc3339
      tag_update_class = "Something"
      occurrence = 1
      update_schedule_name = "${var.environment}-cloud-agent"
      week_day = "Saturday"
  }


 cloud_agent_1 = merge(local.common_deployment_details, local.cloud_agent_details)

}

resource "azurerm_resource_group_template_deployment" "cloud_agent_update_schedule" {
  name                = "var.update_schedule_name"
  resource_group_name = var.resource_group_name
  deployment_mode = "Incremental"
  template_content = templatefile("./update_schedule_template.json", local.cloud_agent_1)
}
