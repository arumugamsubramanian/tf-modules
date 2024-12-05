resource "kubernetes_namespace" "base_ns" {
  metadata {
    name = var.namespace_name
  }
}

output "namespace_name" {
  value = var.namespace_name
}