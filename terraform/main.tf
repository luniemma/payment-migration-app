resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  vnet_address_space  = var.vnet_address_space
  subnet_prefixes     = var.subnet_address_prefixes
  tags                = var.tags
}

module "vm" {
  source              = "./modules/vm"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  nic_id              = module.network.nic_id
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  ssh_public_keys     = var.ssh_public_keys
  vm_size             = var.vm_size
  tags                = var.tags
}