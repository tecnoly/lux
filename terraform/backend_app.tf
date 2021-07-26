resource "kubernetes_secret" "backend_env" {
  metadata {
    name      = "lux-backend-env-vars"
    namespace = kubernetes_namespace.namespace.metadata[0].name
  }

  data = {
    DB_HOST           = data.terraform_remote_state.infrastructure.outputs.database_host
    DB_PORT           = 3306
    DB_USER           = google_sql_user.db_user.name
    DB_PASSWORD       = random_password.db_password.result
    DB_NAME           = google_sql_database.db.name
    NODE_ENV          = "production"
    SECRET            = var.backend_config.jwt.secret
    EXPIRE_DATE_TOKEN = var.backend_config.jwt.expire_date_token
  }
}

module "backend_app" {
  source = "./modules/tecnoly_ecommerce_app"

  name      = "${var.product_name}-backend"
  namespace = kubernetes_namespace.namespace.metadata[0].name
  helm_values = {
    # Image
    "image.repository" = var.backend_config.image_repository
    "image.tag"        = var.backend_config.image_tag
    # Secrets
    "envFromSecret[0].secretRef.name" = kubernetes_secret.backend_env.metadata[0].name
    # Port
    "containerPort"              = 3000
    "livenessProbe.httpGet.path" = "/v1/healthz"
    # Ingress
    "ingress.enabled"                    = true
    "ingress.hosts[0].host"              = "api.${var.domain}"
    "ingress.hosts[0].paths[0].path"     = "/"
    "ingress.hosts[0].paths[0].pathType" = "Prefix"
    "ingress.tls[0].secretName"          = "${var.product_name}-backend-secret-tls"
    "ingress.tls[0].hosts[0]"            = "api.${var.domain}"
  }
  timeout = 60
}