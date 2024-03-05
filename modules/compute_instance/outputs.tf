output "instance_ip" {
  value       = google_compute_instance.default.network_interface.0.network_ip
  description = "The internal ip address of the instance, either manually or dynamically assigned"
}

output "external_ip" {
  value       = try(google_compute_instance.default.network_interface.0.access_config.0.nat_ip, null)
  description = "The external ip address of the instance"
}

output "id" {
  value       = google_compute_instance.default.id
  description = "The identifier for the resource with the format: projects/{{project}}/zones/{{zone}}/instances/{{name}}"
}