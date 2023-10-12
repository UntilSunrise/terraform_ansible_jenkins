terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {}

resource "docker_image" "ubuntu" {
  name = "ubuntu:latest"
  keep_locally = false
}

resource "docker_container" "jenkinsnm" {
  image = docker_image.ubuntu.name
  name = "jenkins_master"
  ports {
    internal = 8080
    external = 8080
  }
  ports {    
    internal = 50000
    external = 50000
  }
  command = ["tail", "-f", "/dev/null"]
}
