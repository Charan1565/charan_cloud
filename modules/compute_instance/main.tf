data "google_project" "default" {
  project_id = var.project
}

resource "google_project_service" "compute_engine" {
  project = var.project
  service = "compute.googleapis.com"
}

resource "google_project_iam_member" "compute_instance_admin" {
  project = var.project
  role    = "roles/compute.instanceAdmin.v1"
  member  = "serviceAccount:service-${data.google_project.default.number}@compute-system.iam.gserviceaccount.com"
  depends_on = [google_project_service.compute_engine]
}

resource "google_compute_resource_policy" "start_stop_schedule" {
  count = var.start_stop_schedule ? 1 : 0

  project = var.project
  region  = var.region
  name    = "start-stop-${var.name}"
  instance_schedule_policy {
    vm_start_schedule {
      schedule = var.start_schedule
    }
    vm_stop_schedule {
      schedule = var.stop_schedule
    }
    time_zone = var.time_zone
  }
  depends_on = [google_project_iam_member.compute_instance_admin]
}

locals {
  start_stop_schedule_policy = var.start_stop_schedule ? google_compute_resource_policy.start_stop_schedule[0].self_link : ""
}

resource "google_compute_instance" "default" {
  project      = var.project
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone
  tags         = var.network_tags
  boot_disk {
    initialize_params {
      image = var.image
      size  = var.disk_size
    }
  }
  network_interface {
    network_ip         = var.network_ip
    subnetwork_project = var.subnet_project
    network            = var.network
    subnetwork         = var.subnetwork
  }

  resource_policies = [local.start_stop_schedule_policy]
  depends_on        = [google_project_iam_member.compute_instance_admin, google_compute_resource_policy.start_stop_schedule]
}