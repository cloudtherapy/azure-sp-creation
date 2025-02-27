# Data Source: Azure Subscription
data "azurerm_subscription" "this" {}

# Data Source: Principal ID of the current user
data "azuread_client_config" "this" {}

#@@@ Create random pet name for service_princpal
resource "random_pet" "this" {
  prefix = "sp-terraform"
  length = 3
}

#@@@ Create an App Registration and Service Principals

resource "azuread_application" "this" {
  display_name = random_pet.this.id
  web {
    redirect_uris = ["https://localhost/"]
  }
  # Two options for sign-in-audience AzureADMyOrg, AzureADMultipleOrgs
  sign_in_audience = "AzureADMyOrg"

  # This required resource adds the API Permission User.Read
  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000"

    resource_access {
      id = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      type = "Scope"
    }
  }
}

#@@@ Create the associated service prinipal from the application

resource "azuread_service_principal" "this" {
  client_id = azuread_application.this.client_id
}

#@@@ Create a client secret for the App Registration. No foreseeable expiration

resource "azuread_application_password" "this" {
  end_date       = "2299-12-30T23:00:00Z"
  application_id = azuread_application.this.id
}

#@@@ Assign 'Contributor' role for the Service Principal in the Azure Subscription

resource "azurerm_role_assignment" "this" {
  scope                = data.azurerm_subscription.this.id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.this.object_id
}