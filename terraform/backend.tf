terraform {
  backend "azurerm" {
    resource_group_name   = "TestResourceGroup"
    storage_account_name  = "truckstoptestsa"
    container_name        = "terraform-state"
    key                   = "test.terraform.tfstate"
  }
}
