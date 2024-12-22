terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.6.3"
    }
  }
}

provider "random" {
  # Configuration options
}

resource "random_pet" "service_principal" {
  prefix = "sp"
}

output "service_principal" {
  value = random_pet.service_principal.id
}