module "cert_manager_controller" {
  source = "../../charts//cert-manager-controller"
  count  = var.cert_manager_controller.enabled ? 1 : 0
  values = {}
  namespace = "kube-system"
}