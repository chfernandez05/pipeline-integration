terraform {
	required_providers {
		docker = {
			source = "kreuzwerker/docker"
			version = "~> 3.0.0"
		}
	}
}

provider "docker" {}

resource "docker_image" "my_app_image" {
	name = "my-local-app:latest"
	keep_locally = true
}

resource "docker_container" "my_app_container" {
	name = "my-running-app"
	image = docker_image.my_app_image.image_id

	ports {
		internal = 5000
		external = 8081
	}
}
