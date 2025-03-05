resource "azurerm_resource_group" "network" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.network.location
  resource_group_name = azurerm_resource_group.network.name
  address_space       = [var.vnet_address_space]
}

resource "azurerm_subnet" "subnet_db" {
  name                 = var.db_subnet_name
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.db_subnet_address]
  service_endpoints    = ["Microsoft.Sql"]
}

resource "azurerm_subnet" "subnet_webapp" {
  name                 = "subnet-webapp-lucas"
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = var.vnet_name
  address_prefixes     = ["10.0.2.0/24"]

  delegation {
    name = "webapp-delegation"
    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}

