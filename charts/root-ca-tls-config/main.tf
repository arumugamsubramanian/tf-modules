data "kustomization_build" "root_ca_tls_config" {
  path = "${path.module}/manifests"
}

resource "kustomization_resource" "p0" {
  for_each = data.kustomization_build.root_ca_tls_config.ids_prio[0]

  manifest = (
    contains(["_/SealedSecret"], regex("(?P<group_kind>.*/.*)/.*/.*", each.value)["group_kind"])
    ? sensitive(data.kustomization_build.root_ca_tls_config.manifests[each.value])
    : data.kustomization_build.root_ca_tls_config.manifests[each.value]
  )
}

resource "kustomization_resource" "p1" {
  for_each = data.kustomization_build.root_ca_tls_config.ids_prio[1]

  manifest = (
    contains(["_/SealedSecret"], regex("(?P<group_kind>.*/.*)/.*/.*", each.value)["group_kind"])
    ? sensitive(data.kustomization_build.root_ca_tls_config.manifests[each.value])
    : data.kustomization_build.root_ca_tls_config.manifests[each.value]
  )
  depends_on = [kustomization_resource.p0]
}

resource "kustomization_resource" "p2" {
  for_each = data.kustomization_build.root_ca_tls_config.ids_prio[2]
  manifest = (
    contains(["_/SealedSecret"], regex("(?P<group_kind>.*/.*)/.*/.*", each.value)["group_kind"])
    ? sensitive(data.kustomization_build.root_ca_tls_config.manifests[each.value])
    : data.kustomization_build.root_ca_tls_config.manifests[each.value]
  )
  depends_on = [kustomization_resource.p1]
}

# resource "kubernetes_manifest" "annotate_secret" {
#   manifest = {
#     apiVersion = "v1"
#     kind       = "Secret"
#     metadata = {
#       name      = "root-ca-tls-secret"
#       namespace = "kube-system"
#       annotations = {
#         "sealedsecrets.bitnami.com/managed" = "true"
#       }
#     }
#     type = "kubernetes.io/tls"
#   }
#
#   depends_on = [kustomization_resource.p2]
#
#   lifecycle {
#     ignore_changes = [
#       manifest["metadata"]["annotations"]
#     ]
#   }
# }