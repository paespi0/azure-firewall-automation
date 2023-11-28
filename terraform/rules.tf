/*
The purpose of this resource is to create a network rule collection for an Azure Firewall. 
A network rule collection is a set of rules that define how traffic is allowed or denied in a network.

- The `azurerm_firewall_network_rule_collection` resource block starts with the keyword `resource` followed by the resource type and a unique name for this resource, in this case, "example".

- Inside the resource block, there are several attributes defined:
  - `name`: Specifies the name of the network rule collection, which is set to "network-rules".
  - `azure_firewall_name`: Specifies the name of the Azure Firewall resource that this network rule collection belongs to. It references another resource named `azurerm_firewall.example.name`.
  - `resource_group_name`: Specifies the name of the resource group where the Azure Firewall and network rule collection are created. It references another resource named `azurerm_resource_group.example.name`.
  - `priority`: Specifies the priority of the network rule collection. Lower numbers indicate higher priority. In this case, it is set to 100.
  - `action`: Specifies the action to be taken for traffic that matches the rules in this collection. It is set to "Allow", meaning the traffic is allowed.

- Inside the resource block, there is a `rule` block that defines a specific rule within the network rule collection. 
This rule allows HTTP traffic from the source IP range "10.0.0.0/16" to any destination IP address on ports 80 and 443 using the TCP protocol.

code creates a network rule collection named "network-rules" for an Azure Firewall. 
It sets a rule to allow HTTP traffic from a specific source IP range to any destination IP address on ports 80 and 443.
*/
resource "azurerm_firewall_network_rule_collection" "example" {
  name                = "network-rules"
  azure_firewall_name = azurerm_firewall.example.name
  resource_group_name = azurerm_resource_group.example.name
  priority            = 100
  action              = "Allow"

  rule {
    name = "allow-http"
    source_addresses = ["10.0.0.0/16"]
    destination_ports = ["80", "443"]
    destination_addresses = ["*"]
    protocols = ["TCP"]
  }
}
