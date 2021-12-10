
variable "automation_account_name" {
  type = string
}

variable "location" {
  description = "Deployment location"
  type        = string
}

variable "resource_group_name" {
  description = "Deployment resource group"
  type        = string
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to be applied"
}

variable "vnet_name" {
  description = "VNET name"
  type        = string
}

variable "key_vault_name" {
  type        = string
  description = "Key Vault name for disk encryption and local admin password"
}


variable "admin_user" {
  type        = string
  description = "User admin name to RDP to Jump box"
}

variable "admin_password" {
  type        = string
  description = "User password to RDP to Jump Box"
}

variable "oms_workspace_name" {
  type        = string
  description = "Workspace name"
}

variable "recovery_policy_name" {
  type        = string
  description = "RSV policy name"
}

variable "recovery_vault_name" {
  type        = string
  description = "RSV name"
}


variable "occurrence" {
  description = "Integer for weekly occurrence"
  type        = number
}

variable "weekDays" {
  description = "List of days to run. One or namy of: Sunday, Monday, Tuesday, Wednesday, Thrusday, Friday, Saturday."
  type        = list(string)
  default     = []
}

variable "diag_storage_name" {
  type        = string
  description = "Jump box diagnostic account"
}


variable "environment" {
  #default = "dev"
  description = "The Environment name, i.e dev, staging, qa, preprod, test, prod..."
}

variable "tenant_id" {
  description = "Tenant id"
}

variable "subscription_id" {
  description = "Spoke subscription id"
}

variable "vm_details" {
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

variable "license_type" {
  type        = string
  default     = "Windows_Server"
  description = "This sets the license_type for the vm. Default is hybrid."
}

variable "db_names" {
  type        = list(string)
  description = "A list, and you are not going to believe this, of database names"
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

variable "private_link_subnet" {
  type        = string
  description = "I'm struggling to get this from the existing information so going down the easy route, at least for now"
}