module "compute_instances" {
  source   = "./modules/compute_instance"
  for_each = var.compute_instances

  project             = var.project_id
  name                = each.key
  machine_type        = each.value.machine_type
  zone                = each.value.zone
  network_tags        = each.value.network_tags
  image               = each.value.image
  disk_size           = each.value.disk_size
  network_ip          = each.value.network_ip
  subnet_project      = var.project_id
  network             = each.value.network_name
  subnetwork          = each.value.subnetwork
  start_stop_schedule = each.value.start_stop_schedule
}

module "cloud_function" {
  source = "./modules/cloudfunction"

  function_name = var.function_name
  location      = var.location
  entry_point   = var.entry_point
}
