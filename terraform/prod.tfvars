# prod.tfvars
resource_group_name = "ProdResourceGroup"
location            = "South Central US"
vnet_name           = "ProdVNet"
subnet_id           = "/subscriptions/9f5b7891-4865-485b-8e6a-974db0107085/resourceGroups/ProdResourceGroup/providers/Microsoft.Network/virtualNetworks/ProdVNet/subnets/AzureFirewallSubnet"
environment = "prod"