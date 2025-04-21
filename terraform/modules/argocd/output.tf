// outputs.tf
output "argocd_namespace" {
  value = helm_release.argocd.namespace
}
