project_id = "donyati-cloud-interns"
region     = "us-central1"
compute_instances = {
  # my-first-compute-instance = {
  #   machine_type        = "e2-standard-4"
  #   zone                = "us-east1-b"
  #   image               = "debian-cloud/debian-11"
  #   disk_size           = 50 # GB
  #   subnetwork          = "default"
  #   network_name        = "default"
  #   network_tags        = ["nonprod-nat"]
  #   start_stop_schedule = true
  # }
}

cloud_function = {
      function_name = "my-cloud-function"
      location      = "us-central1"
      entry_point   = ""
  
}