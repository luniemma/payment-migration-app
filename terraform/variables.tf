variable "client_id" {}
variable "tenant_id" {}
variable "subscription_id" {}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
  default     = "rg-vm-demo-weblogic"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default = {
    Environment = "Dev"
    Owner       = "admin"
  }
}

variable "vnet_address_space" {
  description = "VNet address space"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_address_prefixes" {
  description = "Subnet address prefixes"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "admin_username" {
  description = "VM admin username"
  type        = string
  default     = "adminuser"
}

variable "admin_password" {
  description = "VM admin password"
  type        = string
  sensitive   = true
  default     = null
}

variable "ssh_public_keys" {
  description = "SSH public keys"
  type        = list(string)
  default     = []
}

variable "vm_size" {
  description = "VM size"
  type        = string
  default     = "Standard_B1s"
}

variable "disable_password_authentication" {
  description = "Disable password authentication for the VM"
  type        = bool
  default     = false
}