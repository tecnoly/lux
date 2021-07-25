# resource "kubernetes_secret" "image_pull_secret" {
#   metadata {
#     name = "docker-cfg"
#   }

#   data = {
#     ".dockerconfigjson" = "${file("${path.module}/.docker/config.json")}"
#   }

#   type = "kubernetes.io/dockerconfigjson"
# }