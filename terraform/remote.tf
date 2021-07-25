data "terraform_remote_state" "infrastructure" {
  backend = "remote"

  config = {
    organization = "tecnoly"
    workspaces = {
      name = "infrastructure"
    }
  }
}