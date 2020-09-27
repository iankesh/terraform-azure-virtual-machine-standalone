# Terraform Modules
![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)

Terraform modules for everything.

My Custom Terraform Modules [here](https://registry.terraform.io/namespaces/iankesh).

### Terraform Module to create Virtual Machine in Microsoft Azure
#### Tools Used
- Terraform: Version 0.12.29
- Azurerm provider: Version v2.20.0

#### Parameters to pass
| Parameters | Need | Description
| ------ | ------ | ------ |
source |(Required)|source of this module
base_name|(Required)|Base Name of all the resources being created
location|(Reqiured)|Location of all the resources being created
size_vm|(Required)|Configuration of the VM
os_disk_size|(Reqiured)|Size of the VM
os_profile_username|(Required)|Username of the VM
os_profile_password|(Required)|Password to login to VM
creator|(Optional)|tag a creator

#### Usage:
###### Create new Virtual Machine using module
```terraform
provider "azurerm" {
  version = "=2.20.0"
  features {}
}

module "az_virtual_machine" {
  source              = "../../terraform-azure-virtual-machine-standalone"
  base_name           = "ankesh"
  size_vm             = "Standard_D2_v2"
  os_disk_size        = "30"
  image_publisher     = "Canonical"
  image_offer         = "UbuntuServer"
  image_version       = "latest"
  image_sku           = "18.04-LTS"
  os_profile_username = "devops"
  os_profile_password = "Devops123456789"
  location            = "westeurope"
  creator             = "ankesh"
}
```

#### Terraform Execution:
###### To initialize Terraform:
```sh
terraform init
```

###### To execute Terraform Plan:
```sh
terraform plan
```

###### To apply Terraform changes:
```sh
terraform apply
```

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons Licence" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.
