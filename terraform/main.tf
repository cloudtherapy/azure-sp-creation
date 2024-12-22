#@@@ Create random pet name for service_princpal
resource "random_pet" "this" {
  prefix = "sp"
}

#@@@ Create an App Registration and Service Principal for Azure DevOps

resource "azuread_application" "this" {
  display_name = random_pet.this.id
}

resource "azuread_service_principal" "this" {
  client_id = azuread_application.this.application_id
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