output "mapped_outputs" {
  value       = module.compute_instances.*
  description = "A map of compute instance names to their outputs"
}
