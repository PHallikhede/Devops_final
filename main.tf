########################################
# Resource Group
########################################

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

########################################
# Virtual Network
########################################

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  address_space = ["10.0.0.0/16"]
}

########################################
# Subnet
########################################

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name

  address_prefixes = ["10.0.1.0/24"]
}

########################################
# Public IP
########################################

resource "azurerm_public_ip" "pip" {

  name                = var.public_ip_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  allocation_method = "Static"

  sku = "Standard"
}

########################################
# Network Security Group
########################################

resource "azurerm_network_security_group" "nsg" {

  name                = var.nsg_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {

    name = "Allow-RDP"

    priority = 100

    direction = "Inbound"

    access = "Allow"

    protocol = "Tcp"

    source_port_range = "*"

    destination_port_range = "3389"

    source_address_prefix = "*"

    destination_address_prefix = "*"
  }

  security_rule {

    name = "Allow-HTTP"

    priority = 110

    direction = "Inbound"

    access = "Allow"

    protocol = "Tcp"

    source_port_range = "*"

    destination_port_range = "80"

    source_address_prefix = "*"

    destination_address_prefix = "*"
  }
} 