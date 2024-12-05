module "root_ca_tls_config" {
  source = "../../charts//root-ca-tls-config"
  count  = var.root_ca_tls_config.enabled ? 1 : 0

  values = {
    name = "root-ca-tls-config"
  }
}