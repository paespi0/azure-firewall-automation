terraform {
  backend "azurerm" {
    resource_group_name   = "ProdResourceGroup"
    storage_account_name  = "truckstopprodsa"
    container_name        = "terraform-state"
    key                   = "prod.terraform.tfstate"
  }
}
