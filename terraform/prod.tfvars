# prod.tfvars
resource_group_name = "ProdResourceGroup"
location            = "South Central US"
vnet_name           = "ProdVNet"
subnet_id           = "/subscriptions/500b0c4e-449a-4069-9f8b-623b9d5d810a/resourceGroups/ProdResourceGroup/providers/Microsoft.Network/virtualNetworks/ProdVNet/subnets/AzureFirewallSubnet"
environment = "prod"