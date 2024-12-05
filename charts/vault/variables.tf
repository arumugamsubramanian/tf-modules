variable "values" {
  default = {}
}

variable "namespace" {}


# Vault variables

variable "vault_namespace" {
  type    = string
  default = "vault"
}

variable "vault_service_account_name" {
  type    = string
  default = "vault"
}

variable "vault_server_image_tag" {
  default = "1.12.1"
  type    = string
}

variable "vault_injector_image_tag" {
  default = "1.1.0"
  type    = string
}


# variable "environment" {
#   type = string
# }

# variable "vault_version" {
#   type = string
# }
