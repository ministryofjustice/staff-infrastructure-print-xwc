
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

variable "diag_storage_name" {
  type        = string
  description = "Jump box diagnostic account"
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

variable "load_balancer_rule_port" {
  type        = number
  default     = 443
  description = "Port that will be load balanced. There is a single rule thus a single port"
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
    version   = "latest"
  }
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to be applied"
}

variable "vnet_name" {
  description = "VNET name"
  type        = string
}

variable "vm_details" {
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
  #TODO add validation here to prevent same load balancer from receving two different ip addresses.
}
