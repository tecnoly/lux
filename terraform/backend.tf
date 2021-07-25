terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "tecnoly"

    workspaces {
      name = "lux"
    }
  }
}