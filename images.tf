data "docker_registry_image" "uptime_kuma" {
  name = var.uk_image_name
}

resource "docker_image" "uptime_kuma_image" {
  name          = data.docker_registry_image.uptime_kuma.name
  pull_triggers = [data.docker_registry_image.uptime_kuma.sha256_digest]
  keep_locally  = true
}
