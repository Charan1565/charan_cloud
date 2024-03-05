# Compute Instance Terraform Module

This module manages a Google Compute Engine instance.

## Description

This module creates a Google Compute Engine instance with the specified configuration. It also allows for the instance to be attached to a start/stop schedule.

## Requirements

- Terraform >= 0.12
- Google Provider >= 4.41.0

## Providers

- Google Provider

## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project | The ID of the project in which the resources will be managed. | `string` | n/a | yes |
| name | The name of the instance. | `string` | n/a | yes |
| machine_type | The machine type to create. | `string` | n/a | yes |
| zone | The zone in which to create the instance. | `string` | n/a | yes |
| network_tags | A list of network tags to apply to the instance. | `list(string)` | n/a | no |
| image | The image to use for the instance. | `string` | n/a | yes |
| disk_size | The size of the boot disk in GB. | `integer` | 10 | no |
| network_ip | The internal IP address to assign to the instance. | `string` | n/a | no |
| subnet_project | The project in which the subnet is located. | `string` | n/a | no |
| network | The name of the network to attach the instance to. | `string` | n/a | no |
| subnetwork | The name of the subnetwork to attach the instance to. | `string` | n/a | no |
| start_stop_schedule | Whether or not to create a start/stop schedule for the instance. | `bool` | false | no |
| start_schedule | The schedule to start the instance. | `string` | n/a | no |
| stop_schedule | The schedule to stop the instance. | `string` | n/a | no |
| time_zone | The time zone to use for the start/stop schedule. | `string` | n/a | no |


## Outputs

| Name | Description |
|------|-------------|
| instance_ip | The internal IP address of the instance, either manually or dynamically assigned. |
| id | The ID of the instance. |

## Example

```hcl
module "example_instance" {
  source = "gitlab.kore.korewireless.com/gcp-foundations-terraform/terraform-kore-compute-instance/google"

  project             = "your-project-id"
  name                = "example-instance"
  machine_type        = "n1-standard-1"
  zone                = "us-central1-a"
  network_tags        = ["web", "app"]
  image               = "debian-cloud/debian-9"
  disk_size           = 10
  network_ip          = "10.0.0.2"
  subnet_project      = "your-subnet-project"
  network             = "default"
  subnetwork          = "your-subnetwork"
  start_stop_schedule = true
  start_schedule      = "0 9 * * 1-5"
  stop_schedule       = "0 18 * * 1-5"
  time_zone           = "America/New_York"
}