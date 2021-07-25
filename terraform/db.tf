resource "google_sql_database" "db" {
  name      = var.product_name
  instance  = data.terraform_remote_state.infrastructure.outputs.database_instance_name
  charset   = "utf8"
  collation = "utf8_general_ci"
}

resource "random_password" "db_password" {
  length           = 16
  special          = true
  override_special = "%@"
}

resource "google_sql_user" "db_user" {
  instance = data.terraform_remote_state.infrastructure.outputs.database_instance_name
  name     = var.product_name
  password = random_password.db_password.result
}