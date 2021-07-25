module "frontend_app" {
  source = "./modules/tecnoly_ecommerce_app"

  name      = "${var.product_name}-frontend"
  namespace = kubernetes_namespace.namespace.metadata[0].name
  helm_values = {
    # Image
    "image.repository" = var.frontend_config.image_repository
    "image.tag"        = var.frontend_config.image_tag
    # Ingress
    "ingress.enabled"                    = true
    "ingress.hosts[0].host"              = "panel.${var.domain}"
    "ingress.hosts[0].paths[0].path"     = "/"
    "ingress.hosts[0].paths[0].pathType" = "ImplementationSpecific"
    "ingress.tls[0].secretName"          = "${var.product_name}-frontend-secret-tls"
    "ingress.tls[0].hosts[0]"            = "panel.${var.domain}"
  }
  timeout = 60
}