
resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-RG"
  location = "East US"

  tags = {
    environment = "LAB"
  }

}


resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}-vnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = "${var.prefix}-subnet1"
    address_prefix = "10.0.1.0/24"
  }


  tags = {
    environment = "Production"
  }
}
