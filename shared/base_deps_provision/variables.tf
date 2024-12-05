variable "kubeconfig_path" {
  description = "Path to the kubeconfig file"
  type        = string
  default     = "~/.kube/config"
}

# Namespace name for Kubernetes resources
variable "namespace_name" {
  description = "The name of the Kubernetes namespace to use"
  type        = string
  default     = "default"
}