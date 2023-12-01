terraform {
  backend "azurerm" {
    resource_group_name   = "DevResourceGroup"
    storage_account_name  = "tsdevsa"
    container_name        = "terraform-state"
    key                   = "dev.terraform.tfstate"
  }
}
