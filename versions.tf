terraform {
  required_version = ">=1.0.11"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">=2.15.0"
    }
  }
}
