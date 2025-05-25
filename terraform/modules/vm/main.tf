resource "azurerm_linux_virtual_machine" "main" {
  name                            = "vm-linux"
  resource_group_name             = var.resource_group_name
  location                        = var.location
  size                            = var.vm_size
  admin_username                  = var.admin_username
  disable_password_authentication = length(var.ssh_public_keys) > 0 ? true : false
  admin_password                  = length(var.ssh_public_keys) == 0 ? var.admin_password : null

  # Keep existing dynamic block for SSH keys
  dynamic "admin_ssh_key" {
    for_each = var.ssh_public_keys
    content {
      username   = var.admin_username
      public_key = admin_ssh_key.value
    }
  }

  network_interface_ids           = [var.nic_id]
  tags                            = var.tags

  dynamic "admin_ssh_key" {
    for_each = var.ssh_public_keys
    content {
      username   = var.admin_username
      public_key = admin_ssh_key.value
    }
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}