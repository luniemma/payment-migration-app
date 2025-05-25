variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "nic_id" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "ssh_public_keys" {
  type    = list(string)
  default = []
}

variable "vm_size" {
  type    = string
  default = "Standard_B1s"
}

variable "tags" {
  type = map(string)
}

variable "disable_password_authentication" {
  type    = bool
  default = true
}
