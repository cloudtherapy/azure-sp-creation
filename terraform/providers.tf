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

provider "azuread" {

}

provider "azurerm" {
  features {}
  # TODO: Figure out how to inject the subscription_id
  # run the following command to resolve not having the subscription_id
  # export ARM_SUBSCRIPTION_ID="$(az account list --query "[?isDefault].id" --output tsv)"
}