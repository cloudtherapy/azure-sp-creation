# Data Source: Azure Subscription
data "azurerm_subscription" "this" {
  subscription_id = var.subscription_id
}

# Data Source: Principal ID of the current user
data "azuread_client_config" "this" {}

# Data Source: Azure Resource Group
data "azurerm_resource_group" "this" {
  name = var.resource_group
}

# Data Source: Azure Virtual Network
data "azurerm_virtual_network" "this" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.this.name
}

# Data Source: Azure Virtual Network Subnet
data "azurerm_subnet" "this" {
  name                 = var.subnet_name
  resource_group_name  = data.azurerm_resource_group.this.name
  virtual_network_name = data.azurerm_virtual_network.this.name
}

#@@@ Create random pet name for service_princpal
resource "random_pet" "this" {
  prefix = "sp"
}

#@@@ Create an App Registration and Service Principal for Azure DevOps

resource "azuread_application" "this" {
  display_name = random_pet.this.id
}

resource "azuread_service_principal" "this" {
  client_id = azuread_application.this.client_id
}

#@@@ Create a client secret for the App Registration. No foreseeable expiration

resource "azuread_application_password" "this" {
  end_date       = "2299-12-30T23:00:00Z"
  application_id = azuread_application.this.object_id
}

#@@@ Assign 'Contributor' role for the Service Principal in the Azure Subscription

resource "azurerm_role_assignment" "this" {
  scope                = data.azurerm_subscription.this.id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.this.object_id
}