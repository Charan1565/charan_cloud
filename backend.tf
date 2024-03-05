terraform {
  credentials ="../cft-training.json"
  backend "gcs" {
    bucket = "cloud-intern-terraform-remote-state"
    prefix = "cloud-interns/"
  }
} 