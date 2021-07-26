variable "credentials_file" {
  type        = string
  description = "The contents of the JSON GCP Service Account."
}

variable "project_id" {
  type        = string
  description = "ID of the GCP Project"
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "zone" {
  type    = string
  default = "us-central1-c"
}

variable "domain" {
  type    = string
  default = "luxdgo.com"
}

variable "product_name" {
  type    = string
  default = "lux"
}

variable "backend_config" {
  type = object({
    image_repository = string
    image_tag        = string
    jwt = object({
      secret            = string,
      expire_date_token = string,
    })
  })
  default = {
    image_repository = "gcr.io/tecnoly/lux-backend"
    image_tag        = "latest"
    jwt = {
      secret            = "changeme",
      expire_date_token = "30 days",
    }
  }
}

variable "frontend_config" {
  type = object({
    image_repository = string
    image_tag        = string
  })
  default = {
    image_repository = "gcr.io/tecnoly/lux-frontend"
    image_tag        = "latest"
  }
}