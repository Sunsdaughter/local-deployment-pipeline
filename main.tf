terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "4.5.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

data "docker_image" "app" {
  name = "local-pipeline-app:latest"
}

resource "docker_container" "app" {
  name  = "local-pipeline-app-container"
  image = data.docker_image.app.id

  ports {
    internal = 80
    external = 8080
  }
}
