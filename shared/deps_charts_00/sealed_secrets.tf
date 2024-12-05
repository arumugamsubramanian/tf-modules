module "sealed_secrets" {
  source = "../../charts//sealed-secrets"
  count  = var.sealed_secrets.enabled ? 1 : 0

  values = {
    name = "sealed-secrets"
  }
}