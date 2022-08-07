#Azure Provider Source and version beung used
terraform {
  required_providers{
    azurerm = {
        source = "hashicorp/azurerm"
        version = "=2.52.0"
    }
  }
}

#Configure the Microsoft Azure Provider
provider "azurerm" {
    features {}
  
}

#Create a resource group
resource "azurerm_resource_group" "myrg" {
    name = "terraformRG"
    location = "UK south" 
}

#Create a virtual network within the resource group
resource "azurerm_virtual_network" "myvnet" {
    name = "terraformVnet"
    resource_group_name = azurerm_resource_group.myrg.name
    location = azurerm_resource_group.myrg.location
    address_space = [ "10.0.0.0/16" ]
  
}

#Create a subnet within the vnet
resource "azurerm_subnet" "mysubnet" {
    name = "terraformSubnet"
    resource_group_name = azurerm_resource_group.myrg.name
    virtual_network_name = azurerm_virtual_network.myvnet.name
    address_space = [ "10.0.0.1/24" ]
  
}