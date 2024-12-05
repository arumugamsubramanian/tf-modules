resource "helm_release" "cert_manager_controller" {
  name             = "cert-manager"
  repository       = "https://charts.jetstack.io"
  chart            = "cert-manager"
  namespace        = "kube-system"
  version          = "v1.11.4"

  values = [templatefile("${path.module}/values.yaml", var.values)]
}