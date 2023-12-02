terraform {
  backend "azurerm" {
    resource_group_name   = "ProdResourceGroup"
    storage_account_name  = "tsprosa"
    container_name        = "terraform-state"
    key                   = "prod.terraform.tfstate"
  }
}
