# ☁️ Terraform - Azure Virtual WAN + Hub

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "network" {
  name     = "rg-networking-lab"
  location = "East US"
}

# Virtual WAN
resource "azurerm_virtual_wan" "vwan" {
  name                = "core-vwan"
  resource_group_name = azurerm_resource_group.network.name
  location            = azurerm_resource_group.network.location
  type                = "Standard"
}

# Hub dentro da Virtual WAN
resource "azurerm_virtual_hub" "hub" {
  name                = "hub-eastus"
  resource_group_name = azurerm_resource_group.network.name
  location            = azurerm_resource_group.network.location
  address_prefix      = "10.1.0.0/16"
  virtual_wan_id      = azurerm_virtual_wan.vwan.id
}

# Peering global pode ser configurado entre hubs
