
provider "google" {}

resource "google_cloud_function" "my_function" {
  name        = var.function_name    
  location    = var.location         
  entry_point = var.entry_point       

}
