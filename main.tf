# RESOURCE GROUP
resource "azurerm_resource_group" "az_rg" {
  name     = "${var.base_name}-rg"
  location = var.location

  tags = {
    Region      = var.location
    Team        = var.team_tag
    Environment = var.env
    Creator     = var.creator
  }
}

# VIRTUAL NETWORK
resource "azurerm_virtual_network" "az_vnet" {
  name                = "${var.base_name}-vnet"
  location            = var.location
  resource_group_name = azurerm_resource_group.az_rg.name
  address_space       = [var.address_space]

  tags = {
    Region      = var.location
    Team        = var.team_tag
    Environment = var.env
    Creator     = var.creator
  }
}

# SUBNET
resource "azurerm_subnet" "az_subnet" {
  name                 = "${var.base_name}-snet"
  resource_group_name  = azurerm_resource_group.az_rg.name
  virtual_network_name = azurerm_virtual_network.az_vnet.name
  address_prefixes     = [var.address_prefix]
}

# SECURITY GROUP
resource "azurerm_network_security_group" "az_security_group" {
  name                = "${var.base_name}-sg"
  location            = var.location
  resource_group_name = azurerm_resource_group.az_rg.name

  security_rule {
    name                       = "${var.base_name}-sg-rule"
    priority                   = var.security_priority
    direction                  = var.security_direction
    access                     = var.security_access
    protocol                   = var.security_protocol
    source_port_range          = var.security_source_port
    destination_port_ranges    = var.security_destination_port
    source_address_prefix      = var.security_source_address_prefix
    destination_address_prefix = var.security_destination_address_prefix
  }

  tags = {
    Region      = var.location
    Team        = var.team_tag
    Environment = var.env
    Creator     = var.creator
  }
}

# PUBLIC IP
resource "azurerm_public_ip" "az_public_ip" {
  name                = "${var.base_name}-pip"
  resource_group_name = azurerm_resource_group.az_rg.name
  location            = var.location
  allocation_method   = var.allocation
  ip_version          = var.ip_version

  tags = {
    Region      = var.location
    Team        = var.team_tag
    Environment = var.env
    Creator     = var.creator
  }
}

# NETWORK INTERFACE CONTROLLER
resource "azurerm_network_interface" "az_network_interface" {
  name                = "${var.base_name}-nic"
  location            = var.location
  resource_group_name = azurerm_resource_group.az_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.az_subnet.id
    private_ip_address_allocation = var.private_ip_allocation
    public_ip_address_id          = azurerm_public_ip.az_public_ip.id
  }
  tags = {
    Region      = var.location
    Team        = var.team_tag
    Environment = var.env
    Creator     = var.creator
  }
}

# VIRTUAL MACHINE
resource "azurerm_virtual_machine" "az_virtual_machine" {
  name                          = "${var.base_name}-vm"
  location                      = var.location
  resource_group_name           = azurerm_resource_group.az_rg.name
  network_interface_ids         = [azurerm_network_interface.az_network_interface.id]
  vm_size                       = var.size_vm
  delete_os_disk_on_termination = var.delete_os_disk

  storage_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  storage_os_disk {
    name              = "${var.base_name}-vm-disk"
    caching           = var.os_disk_caching
    create_option     = var.os_disk_create
    managed_disk_type = var.os_disk_type
    disk_size_gb      = var.os_disk_size
  }

  os_profile {
    computer_name  = "${var.base_name}-vm-host"
    admin_username = var.os_profile_username
    admin_password = var.os_profile_password
  }

  os_profile_linux_config {
    disable_password_authentication = var.os_profile_password_auth
  }

  tags = {
    Region      = var.location
    Team        = var.team_tag
    Environment = var.env
    Creator     = var.creator
  }
}
