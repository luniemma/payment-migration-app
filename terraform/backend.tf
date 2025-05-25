terraform {
  backend "azurerm" {
    resource_group_name  = "backend-demo-rg"
    storage_account_name = "terraformtf2025iac"
    container_name      = "tfstate"
    key                 = "terraform.tfstate"
  }
}
