# resource "kubernetes_namespace" "ingress_nginx" {
#   count = var.kind_ingress_nginx.enabled ? 1 : 0
#   metadata {
#     name = "ingress-nginx"
#   }
# }

module "kind_ingress_nginx" {
  source = "../../charts//kind-ingress-nginx"
  count  = var.kind_ingress_nginx.enabled ? 1 : 0

  values = {}

  # depends_on = [
  #   kubernetes_namespace.ingress_nginx,
  # ]
}