terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.114.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.2"
    }
  }
  required_version = "=1.5.7"

  backend "azurerm" {
    # Not required when run in pipeline, only required for command line testing
    storage_account_name = "stxwctfstate001"
    resource_group_name  = "rg-xwc-core-001"
    container_name       = "tfstate"
    key                  = "xwcapp.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}
