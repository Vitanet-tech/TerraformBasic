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
    name = "terraform-vnet"
    resource_group_name = azurerm_resource_group.myrg.name
    location = azurerm_resource_group.myrg.location
    address_space = [ "10.0.0.0/16" ] 
}

#Create a subnet within the vnet
resource "azurerm_subnet" "mysubnet" {
    name = "terraform-subnet"
    resource_group_name = azurerm_resource_group.myrg.name
    virtual_network_name = azurerm_virtual_network.myvnet.name
    address_prefixes = [ "10.0.0.0/24" ]
  }


#Create a Storage within the resource group
resource "azurerm_storage_account" "vitastore24" {
    name = "vitastore24"
    resource_group_name = azurerm_resource_group.myrg.name
    location = azurerm_resource_group.myrg.location
    account_tier = "Standard"
    account_replication_type = "LRS"
    allow_blob_public_access = true
  }