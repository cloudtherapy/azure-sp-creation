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
  value = azuread_subcription.this.subscription_id.id
}

output "tenant_id" {
  value = azuread_subscription.this.tenant_id.id
}