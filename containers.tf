resource "docker_container" "uptime_kuma" {
  name  = var.uk_container_name
  image = docker_image.uptime_kuma_image.latest

  restart = var.restart_policy

  ports {
    internal = 3001
    external = var.access_port
    ip       = var.access_interface_bind
    protocol = "tcp"
  }

  #  networks_advanced {
  #    name = docker_network.uptime_kuma_network.name
  #  }

  #  networks_advanced {
  #    name = data.docker_network.host_network.name
  #  }

  volumes {
    container_path = "/app/data"
    host_path      = docker_volume.uptime_kuma_volume.mountpoint
    read_only      = false
  }
}
