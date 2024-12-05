variable "kubeconfig_path" {
  description = "Path to the kubeconfig file"
  type        = string
  default     = "~/.kube/config"
}

variable "vault" {
  type = object({
    enabled = optional(bool, false)
    values  = optional(map(any), {})
  })

  default = {
    enabled = false
    values  = {}
  }
}

variable "namespace_name" {
  description = "The name of the Kubernetes namespace to use"
  type        = string
  default     = "default"
}

variable "sealed_secrets" {
  type = object({
    enabled = optional(bool, false)
    values  = optional(map(any), {})
  })

  default = {
    enabled = false
    values  = {}
  }
}

variable "root_ca_tls_config" {
  type = object({
    enabled = optional(bool, false)
    values  = optional(map(any), {})
  })

  default = {
    enabled = false
    values  = {}
  }
}

variable "cert_manager_controller" {
  type = object({
    enabled = optional(bool, false)
    values  = optional(map(any), {})
  })

  default = {
    enabled = false
    values  = {}
  }
}

variable "kind_ingress_nginx" {
  type = object({
    enabled = optional(bool, false)
    values  = optional(map(any), {})
  })

  default = {
    enabled = false
    values  = {}
  }
}

