provider "kubernetes" {
  config_path = var.kubeconfig_path
  config_context = "kind-local-kind-cluster"
}

provider "helm" {
  kubernetes {
    config_path = var.kubeconfig_path
    config_context = "kind-local-kind-cluster"
  }
}

provider "kustomization" {
  kubeconfig_path = "~/.kube/config"
  context = "kind-local-kind-cluster"
}

