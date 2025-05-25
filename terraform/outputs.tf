output "vm_id" {
  value = module.vm.vm_id
}

output "vm_public_ip" {
  value = module.network.public_ip_address
}

output "vm_private_ip" {
  value = module.network.private_ip_address
}