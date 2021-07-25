resource "kubernetes_namespace" "namespace" {
  metadata {
    name = var.product_name
  }
}