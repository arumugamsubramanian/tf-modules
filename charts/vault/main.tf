resource "helm_release" "vault_deploy" {
  name       = "vault"
  repository = path.module
  chart      = "${path.module}/vault"
  namespace  = var.namespace
  version    = var.values.version

  values = [
    templatefile("${path.module}/values.yaml", {
      vault_injector_image_tag    = var.vault_injector_image_tag,
      vault_server_image_tag      = var.vault_server_image_tag,
      vault_chart_name            = "vault",
    })
  ]

  # lifecycle {
  #   ignore_changes = [
  #     metadata
  #   ]
  # }
}