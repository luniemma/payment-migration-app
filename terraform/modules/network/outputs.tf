output "nic_id" {
  value = azurerm_network_interface.main.id
}

output "public_ip_address" {
  value = azurerm_public_ip.main.ip_address
}

output "private_ip_address" {
  value = azurerm_network_interface.main.private_ip_address
}