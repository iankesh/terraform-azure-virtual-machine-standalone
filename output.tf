# GENERAL
output "az_location" {
  description = "The location of resources being created"
  value = var.location
}

# RESOURCE GROUP
output "az_rg_id" {
  description = "The Respurce ID of the Resource Group"
  value = azurerm_resource_group.az_rg.id
}

output "az_rg_name" {
  description = "The Respurce name of the Resource Group"
  value = azurerm_resource_group.az_rg.name
}

# VIRTUAL NETWORK
output "az_vnet_id" {
  description = "The id of the newly created vNet"
  value = azurerm_virtual_network.az_vnet.id
}

output "az_vnet_name" {
  description = "The Name of the newly created vNet"
  value = azurerm_virtual_network.az_vnet.name
}

output "az_vnet_location" {
  description = "The location of the newly created vNet"
  value = azurerm_virtual_network.az_vnet.location
}

output "az_vnet_address_space" {
  description = "The address space of the newly created vNet"
  value = azurerm_virtual_network.az_vnet.address_space
}

# SUBNET
output "az_subnet_id" {
  description = "The id of the newly created subnet"
  value = azurerm_subnet.az_subnet.id
}

output "az_subnet_name" {
  description = "The Name of the newly created subnet"
  value = azurerm_subnet.az_subnet.name
}

output "az_subnet_address_prefix" {
  description = "The address space of the newly created subnet"
  value = azurerm_subnet.az_subnet.address_prefixes
}

# SECURITY GROUP
output "az_security_group_id" {
  description = "The id of the newly created Security Group"
  value       = azurerm_network_security_group.az_security_group.id
}

output "az_security_group_name" {
  description = "The name of the newly created Security Group"
  value       = azurerm_network_security_group.az_security_group.name
}

# PUBLIC IP
output "az_public_ip_address" {
  description = "The address of the newly created Public IP"
  value       = azurerm_public_ip.az_public_ip.ip_address
}

output "az_public_ip_id" {
  description = "The id of the newly created Public IP"
  value       = azurerm_public_ip.az_public_ip.id
}

output "az_public_ip_name" {
  description = "The name of the newly created Public IP"
  value       = azurerm_public_ip.az_public_ip.name
}

# NETWORK INTERFACE CONTROLLER
output "az_network_interface_id" {
  description = "The id of the newly created Network Interface"
  value       = azurerm_network_interface.az_network_interface.id
}

output "az_network_interface_name" {
  description = "The name of the newly created Network Interface"
  value       = azurerm_network_interface.az_network_interface.name
}

# VIRTUAL MACHINE
output "az_virtual_machine_id" {
  description = "The id of the newly created Virtual Machine"
  value       = azurerm_virtual_machine.az_virtual_machine.id
}

output "az_virtual_machine_name" {
  description = "The name of the newly created Virtual Machine"
  value       = azurerm_virtual_machine.az_virtual_machine.name
}
