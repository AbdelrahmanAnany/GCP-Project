#create new vpc
resource "google_compute_network" "abdelrahman-vpc" {
  name                    = "abdelrahman-vpc"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}
