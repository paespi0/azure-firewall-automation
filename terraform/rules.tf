resource "azurerm_firewall_network_rule_collection" "example_network_rules" {
  name                = "exampleNetworkRules"
  azure_firewall_name = azurerm_firewall.example_firewall.name
  resource_group_name = var.resource_group_name
  priority            = 100
  action              = "Allow"

  rule {
    name = "allow-http"
    source_addresses = ["10.0.0.0/24"]
    destination_ports = ["80", "443"]
    destination_addresses = ["*"]
    protocols = ["TCP"]
  }

  # Add more rules as needed!
  rule {
    name = "allow-ssh"
    source_addresses = ["10.0.0.0/16"]
    destination_ports = ["22"]
    destination_addresses = ["*"]
    protocols = ["TCP"]
  }

}

resource "azurerm_firewall_application_rule_collection" "example_app_rules" {
  name                = "exampleAppRules"
  azure_firewall_name = azurerm_firewall.example_firewall.name
  resource_group_name = var.resource_group_name
  priority            = 200
  action              = "Allow"

  rule {
    name = "allow-bing"
    source_addresses = ["10.0.0.0/16"]
    target_fqdns = ["*.bing.com"]
    protocol {
      type = "Http"
      port = 80
    }
    protocol {
      type = "Https"
      port = 443
    }
  }

  # Add more rules as needed
}
