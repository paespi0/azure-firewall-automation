# dev.tfvars
resource_group_name = "DevResourceGroup"
location            = "South Central US"
vnet_name           = "DevVNet"
subnet_id = "/subscriptions/500b0c4e-449a-4069-9f8b-623b9d5d810a/resourceGroups/DevResourceGroup/providers/Microsoft.Network/virtualNetworks/DevVNet/subnets/AzureFirewallSubnet"
environment = "dev"