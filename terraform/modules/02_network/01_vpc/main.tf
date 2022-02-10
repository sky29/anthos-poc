resource "google_compute_network" "gcp_vpc" {
  name = var.vpc_name
  project = var.project_id
  auto_create_subnetworks = false
}