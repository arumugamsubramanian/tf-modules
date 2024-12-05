provider "kubernetes" {
  config_path = var.kubeconfig_path
  config_context = "kind-local-kind-cluster"
}