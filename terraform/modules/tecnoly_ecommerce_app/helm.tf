resource "helm_release" "tecnoly_ecommerce" {
  name      = var.name
  namespace = var.namespace
  chart     = "${path.module}/tecnoly-ecommerce"
  timeout   = var.timeout

  dynamic "set" {
    for_each = var.helm_values
    content {
      name  = set.key
      value = set.value
    }
  }
}
