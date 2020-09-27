# GENERAL
variable "env" {
  description = "(Required) name of the resource group"
  default     = "dev"
}

variable "location" {
  description = "(Required) location where this resource has to be created"
  default     = "westeurope"
}

variable "team_tag" {
  description = "(Optional) tag a team"
  default     = "DevOps"
}

variable "creator" {
  description = "(Optional) tag a creator"
  default     = "iankesh"
}

variable "base_name" {
  description = "(Required) name of the resource group"
  default     = "cloud"
}

# RESOURCE GROUP

# VIRTUAL NETWORK
variable "address_space" {
  description = "(Required) The address space that is used by the virtual network."
  type        = string
  default     = "10.0.2.0/24"
}

#SUBNET
variable "address_prefix" {
  description = "(Required) The address prefix that is used by the subnet."
  type        = string
  default     = "10.0.2.0/26"
}

# SECURITY GROUP
variable "security_priority" {
  description = "(Required) The priority of the rule. The value can be between 100 and 4096"
  default     = "101"
}

variable "security_direction" {
  description = "(Required) If the traffic is incoming or Outgoing. Possible values are Inbound and Outbound"
  default     = "Inbound"
}

variable "security_access" {
  description = "(Required) If the traffic is allowed or denied. Possible values are Allow and Deny"
  default     = "Allow"
}

variable "security_protocol" {
  description = "(Required) Network protocol rule. Possible values are Tcp, Udp, Icmp, or * to match all"
  default     = "Tcp"
}

variable "security_source_port" {
  description = "(Required) List of source ports"
  default     = "*"
  type        = string
}

variable "security_destination_port" {
  description = "(Required) List of destination ports"
  default     = ["80", "443", "22"]
}

variable "security_source_address_prefix" {
  description = "(Required) Source IP"
  default     = "*"
}

variable "security_destination_address_prefix" {
  description = "(Required) Destination IP"
  default     = "*"
}

# PUBLIC IP
variable "allocation" {
  description = "(Required) The allocation method if this IP address. Possible values are Static or Dynamic"
  default     = "Static"
}

variable "ip_version" {
  description = "(Optional) The Ip version. Possible values are IPv4 and IPv6"
  default     = "IPv4"
}

# NETWORK INTERFACE CONTROLLER
variable "private_ip_allocation" {
  description = "(Required) The allocation method for IP. Possible values are Dynamic and Static"
  default     = "Dynamic"
}

# VIRTUAL MACHINE
variable "size_vm" {
  description = "(Required) The size of Virtual Machine"
  default     = "Standard_D2_v2"
}

variable "delete_os_disk" {
  description = "(Optional) If you want the disk to be deleted while termination. Possible values are true and false"
  default     = "true"
}

variable "image_publisher" {
  description = "(Required) Publisher of the image"
  default     = "Canonical"
}

variable "image_offer" {
  description = "(Required) Offer of the image"
  default     = "UbuntuServer"
}

variable "image_version" {
  description = "(Required) Version of the image"
  default     = "latest"
}

variable "image_sku" {
  description = "(Required) SKU of the image"
  default     = "18.04-LTS"
}

variable "os_disk_caching" {
  description = "(Required) caching requirement of OS Disk"
  default     = "ReadWrite"
}

variable "os_disk_create" {
  description = "(Required) How to create OS Disk"
  default     = "FromImage"
}

variable "os_disk_type" {
  description = "(Required) Type of managed OS Disk"
  default     = "Standard_LRS"
}

variable "os_disk_size" {
  description = "(Required) Type of managed OS Disk"
  default     = "30"
}

variable "os_profile_username" {
  description = "(Required) Username of the vm"
  default     = "devops"
}

variable "os_profile_password" {
  description = "(Required) Passoword of the vm"
  default     = "Devops123456789"
}

variable "os_profile_password_auth" {
  description = "(Required) Disable password authentication. Possible vales are true or false"
  default     = "false"
}


