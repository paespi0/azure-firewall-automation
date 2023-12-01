resource "azurerm_firewall" "example_firewall" {
  name                = "exampleFirewall"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "AZFW_VNet" # This should be set to the appropriate SKU for your use case.
  sku_tier            = "Standard"  # Choose between "Standard" and "Premium" based on your needs.

  ip_configuration {
    name                 = "configuration"
    subnet_id            = var.subnet_id
    public_ip_address_id = azurerm_public_ip.example.id
  }
}

resource "azurerm_public_ip" "example" {
  name                = "examplePublicIpProd"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}
