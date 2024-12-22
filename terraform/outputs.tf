output "client_id" {
  value = azuread_application.this.client_id
}

output "client_secret" {
  value = nonsensitive(azuread_application_password.this.value)
}

output "subscription_id" {
  value = var.subscription_id
}