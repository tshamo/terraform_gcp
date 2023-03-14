resource "google_compute_network" "vpc_network_terra" {
  project                 = var.project_id
  name                    = "vpc-network-terra"
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "subnetwork-ipv4-terra" {
  name          = "ipv4-test-subnetwork"
  ip_cidr_range = "10.0.0.0/22"
  region        = "us-east1"
  network       = google_compute_network.vpc_network_terra.id

}