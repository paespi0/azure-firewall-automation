# dev.tfvars
resource_group_name = "DevResourceGroup"
location            = "South Central US"
vnet_name           = "DevVNet"
subnet_id = "/subscriptions/9f5b7891-4865-485b-8e6a-974db0107085/resourceGroups/DevResourceGroup/providers/Microsoft.Network/virtualNetworks/DevVNet/subnets/AzureFirewallSubnet"
environment = "dev"