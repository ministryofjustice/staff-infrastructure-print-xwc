variable "admin_user" {
  type        = string
  description = "User admin name to RDP to Jump box"
}

variable "admin_password" {
  type        = string
  description = "User password to RDP to Jump Box"
}

variable "app_resource_group_name" {
  description = "Deployment resource group"
  type        = string
}

variable "automation_account_name" {
  type = string
}

variable "core_resource_group_name" {
  description = "Deployment resource group"
  type        = string
}


#TODO: Consider whether disk related stuff is needed
variable "cloud_agent_vm_details" {
  type = map(object({
    availability_zone = list(string),
    nic = object({
      subnet     = string
      ip_address = string
    }),
    load_balancer = object({
      name       = string
      ip_address = string
    }),
    storage_data_disk = object({
      type = string
      size = string
    })
    tag_update_class = string,
    os_disk_type     = string,
    vm_size          = string
  }))
  default = {}
}

variable "db_names" {
  type        = list(string)
  description = "A list, and you are not going to believe this, of database names"
}

variable "device_manager_vm_details" {
  type = map(object({
    availability_zone = list(string),
    nic = object({
      subnet     = string
      ip_address = string
    }),
    storage_data_disk = object({
      type = string
      size = string
    })
    tag_update_class = string,
    os_disk_type     = string,
    vm_size          = string
  }))
}

variable "diag_storage_name" {
  type        = string
  description = "Jump box diagnostic account"
}

variable "elastic_pool_name" {
  type        = string
  description = "Name of the elastic pool"
}

variable "e_pool_capacity" {
  type        = number
  description = "capacity of the elastic pool e.g. 50 or 100 "
}

variable "environment" {
  default     = "xwc"
  description = "this is actually the spoke name"
}

variable "key_vault_name" {
  type        = string
  description = "Key Vault name for disk encryption and local admin password"
}

variable "license_type" {
  type        = string
  default     = "Windows_Server"
  description = "This sets the license_type for the vm. Default is hybrid."
}

variable "location" {
  description = "Deployment location"
  type        = string
}

variable "oms_workspace_name" {
  type        = string
  description = "Workspace name"
}

variable "private_link_subnet" {
  type        = string
  description = "I'm struggling to get this from the existing information so going down the easy route, at least for now"
}


variable "recovery_policy_name" {
  type        = string
  description = "RSV policy name"
}

variable "recovery_vault_name" {
  type        = string
  description = "RSV name"
}

variable "storage_image_reference" {
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  default = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-datacenter-gensecond"
  version = "latest" }
}

variable "sqldb_azuread_administrator" {
  type = object({
    username  = string
    object_id = string
  })
}

variable "sql_server_administrator" {
  type        = string
  default     = "sqladmin"
  description = "Will Also be stored in KV"
}

variable "sql_server_name" {
  type        = string
  description = "Will Also be stored in KV"
}

variable "subscription_id" {
  description = "Spoke subscription id"
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to be applied"
}

variable "tenant_id" {
  description = "Tenant id"
}

variable "value_txt_record" {
  description = "value of print txt record in private dns zone"
  type        = string
}


variable "vnet_name" {
  description = "VNET name"
  type        = string
}