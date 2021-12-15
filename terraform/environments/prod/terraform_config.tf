terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.88.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
  required_version = "=1.0.7"

  backend "azurerm" {
    # Not required when run in pipeline, only required for command line testing
    # storage_account_name = "samojtfstate003"
    # resource_group_name  = "rg-prod-tfstate-001"
    storage_account_name = "samojtfstate001"
    resource_group_name  = "rg-terraform-statefiles-001"
    container_name       = "tfstate"
    key                  = "xwcapp.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}
