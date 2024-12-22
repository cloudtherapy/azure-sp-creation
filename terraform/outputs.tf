output "sp_name" {
  value = random_pet.this.id
}

output "client_id" {
  value = azuread_application.this.client_id
}

output "client_secret" {
  value = nonsensitive(azuread_application_password.this.value)
}

output "subscription_id" {
  value = data.azurerm_subscription.this.subscription_id.id
}

output "tenant_id" {
  value = data.azuread_client_config.this.tenant_id
}