provider "google" {
  credentials = base64decode(var.credentials_file)

  project = var.project_id
  region  = var.region
  zone    = var.zone
}

data "google_client_config" "provider" {}

provider "helm" {
  kubernetes {
    host  = "https://${data.terraform_remote_state.infrastructure.outputs.endpoint}"
    token = data.google_client_config.provider.access_token
    cluster_ca_certificate = base64decode(
      data.terraform_remote_state.infrastructure.outputs.cluster_ca_certificate,
    )
  }
}

provider "kubernetes" {
  host  = "https://${data.terraform_remote_state.infrastructure.outputs.endpoint}"
  token = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(
    data.terraform_remote_state.infrastructure.outputs.cluster_ca_certificate,
  )
}