variable "SUBSCRIPTION_ID" {
  type        = string
  description = "Subscription Id where the resources exists"
}

variable "SP_CLIENT_ID" {
  type        = string
  description = "Service Principal appId"
}

variable "SP_CLIENT_SECRET" {
  type        = string
  description = "Service Principal password"
}

variable "SP_TENANT_ID" {
  type        = string
  description = "Service Principal tenant"
}

variable "STUDENT_NAME" {
  type        = string
  description = "The Name that will be used to set the resources names"
}

variable "AZURE_LOCATION" {
  type        = string
  description = "The Azure location where the resources exists"
}

variable "VNET_ADDRESS_SPACE" {
  type        = string
  description = "The cidr used for the virtual network"
}

variable "SUBNET_ADDRESS_PREFIX" {
  type        = string
  description = "The cidr used for the subnet"
}

variable "VM_ADMIN_PASSWORD" {
  type        = string
  description = "The password uses to access the VM"
}