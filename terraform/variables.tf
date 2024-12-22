variable "label" {
  type        = string
  description = "A description of the target environment platform"
  default     = "sample"
}

## Azure connection details

variable "tenant_id" {
  type        = string
  description = "Azure AD directory/tenant ID"
}

variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID"
}

## Azure resource details

variable "resource_group" {
  type        = string
  description = "Name of the resource group for resource deployment"
  default     = "rg-shared-services"
}

variable "vnet_name" {
  type        = string
  description = "Name of the virtual network"
}

variable "subnet_name" {
  type        = string
  description = "Name of the virtual network subnet"
}