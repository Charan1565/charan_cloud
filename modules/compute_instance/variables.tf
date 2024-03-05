variable "project" {
  description = "The ID of the project in which the resources will be managed."
  type        = string
}

variable "name" {
  description = "The name of the instance."
  type        = string
}

variable "machine_type" {
  description = "The machine type to create."
  type        = string
}

variable "region" {
  description = "The region where the resources will reside"
  type        = string
  default     = "us-east1"
}

variable "zone" {
  description = "The zone in which the instances will be created."
  type        = string
}

variable "network_tags" {
  description = "The network tags to assign to the instances."
  type        = list(string)
}

variable "image" {
  description = "The image from which to initialize the boot disk."
  type        = string
}

variable "disk_size" {
  description = "The size in GB of the boot disk"
  type        = number
}

variable "network_ip" {
  description = "The private IP address to assign to the instance."
  type        = string
  default     = ""
}

variable "subnet_project" {
  description = "The ID of the project in which the subnet exists."
  type        = string
}

variable "network" {
  description = "The network to which the instances will be connected."
  type        = string
}

variable "subnetwork" {
  description = "The subnetwork to which the instances will be connected."
  type        = string
}

variable "start_schedule" {
  type        = string
  description = "The schedule for starting instances in unix-cron format"
  default     = "0 7 * * 1-5"
}

variable "stop_schedule" {
  type        = string
  description = "The schedule for stopping instances in unix-cron format"
  default     = "0 19 * * 1-5"
}

variable "time_zone" {
  type        = string
  description = "Specifies the time zone to be used in interpreting the schedule. The value of this field must be a time zone name from the tz database."
  default     = "America/New_York"
}
variable "start_stop_schedule" {
  type        = bool
  default     = false
  description = "Whether or not to attach instance to start/stop schedule"
} 