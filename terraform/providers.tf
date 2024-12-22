terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.14.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "3.0.2"
    }
  }
}

# Azure Active Directory provider
# https://registry.terraform.io/providers/hashicorp/azuread/latest/docs
provider "azuread" {
  tenant_id = data.azurerm_subscription.this.tenant_id
}

# Azure Resource Manager provider
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
provider "azurerm" {
  features {}
  subscription_id = data.azurerm_subscription.this.subscription_id
}