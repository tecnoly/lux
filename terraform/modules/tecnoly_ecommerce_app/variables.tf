variable "name" {}
variable "helm_values" {}
variable "namespace" {
  default = "default"
}
variable "timeout" {
  default = 300
}