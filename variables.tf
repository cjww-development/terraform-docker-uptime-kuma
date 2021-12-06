variable "docker_host" {
  type        = string
  description = "The host where docker resides"
}

variable "uk_image_name" {
  type        = string
  description = "The name of the Flame docker image that should be pulled"
}

variable "uk_volume_name" {
  type        = string
  description = "The name of the docker volume to be used by the Flame container"
}

variable "uk_network_name" {
  type        = string
  description = "The name of the docker network that the Flame container will be connected to"
}

variable "uk_container_name" {
  type        = string
  description = "The name of the Flame container to be created"
}

variable "restart_policy" {
  type        = string
  description = "The restart policy for the container. Must be one of 'no', 'on-failure', 'always', 'unless-stopped'. Defaults to no."
  validation {
    condition = contains(
      [
        "no",
        "on-failure",
        "always",
        "unless-stopped"
      ],
      var.restart_policy
    )
    error_message = "The provided value did not match a valid value."
  }
}

variable "access_port" {
  type        = number
  description = "The host port number the internal port 3001 will map to"
  default     = 3001
}

variable "access_interface_bind" {
  type        = string
  description = "The network interface that the 3001 port will bind to"
  default     = "0.0.0.0"
}
