resource "kubernetes_namespace" "vault" {
  count = var.vault.enabled ? 1 : 0
  metadata {
    name = "vault"
  }
}

module "vault" {
  count  = var.vault.enabled ? 1 : 0
  source = "../../charts/vault"
  namespace = kubernetes_namespace.vault[0].metadata[0].name
  values = {
    version = var.vault.values.version
  }
}
