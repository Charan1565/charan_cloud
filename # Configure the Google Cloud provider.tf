# Configure the Google Cloud provider
provider "google" {
  project = "248687480199"
  region  = "us-east1-b"
}

# Define your GCP resources here
resource "google_compute_instance" "webserver" {
  name         = "my-webserver"
  machine_type = "e2-micro"
  zone         = "your_zone"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
  }
}
