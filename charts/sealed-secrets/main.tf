data "kustomization_build" "sealed_secrets" {
  path = "${path.module}/manifests"
}

resource "kustomization_resource" "p0" {
  for_each = data.kustomization_build.sealed_secrets.ids_prio[0]

  manifest = data.kustomization_build.sealed_secrets.manifests[each.value]
}

resource "kustomization_resource" "p1" {
  for_each = data.kustomization_build.sealed_secrets.ids_prio[1]

  manifest = data.kustomization_build.sealed_secrets.manifests[each.value]
  depends_on = [kustomization_resource.p0]
}

resource "kustomization_resource" "p2" {
  for_each = data.kustomization_build.sealed_secrets.ids_prio[2]
  manifest = data.kustomization_build.sealed_secrets.manifests[each.value]
  depends_on = [kustomization_resource.p1]
}