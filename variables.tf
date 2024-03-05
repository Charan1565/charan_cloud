variable "project_id" {
  description = "The project ID to deploy infrastructure to"
  type        = string
}

variable "region" {
  description = "The region to deploy to"
  type        = string
}

variable "compute_instances" {
  description = "A map of compute instance names to their configurations"
  type = map(object({
    machine_type        = string
    zone                = string
    network_tags        = list(string)
    image               = string
    disk_size           = number
    network_ip          = optional(string, "")
    external_ip         = optional(bool, false)
    network_name        = string
    subnetwork          = string
    start_stop_schedule = optional(bool, true)
    start_schedule      = optional(string, "07:00")
    stop_schedule       = optional(string, "17:00")
    time_zone           = optional(string, "America/Chicago")
  }))
}



variable "cloud_function"{

}