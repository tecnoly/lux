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
  })
  default = {
    image_repository = "gcr.io/tecnoly/lux-backend"
    image_tag        = "latest"
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