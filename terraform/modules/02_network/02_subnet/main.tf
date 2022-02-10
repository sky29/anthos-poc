resource "google_compute_subnetwork" "gcp_subnet" {
  name                    = var.subnet_name
  
  project                 = var.project_id
  network                 = var.vpc_id
  region                  = var.region
  ip_cidr_range           = var.ip_cidr_range

  dynamic "secondary_ip_range" {
    for_each              = var.secondary_ip_ranges
    content {
      range_name            = secondary_ip_range.value.range_name
      ip_cidr_range         = secondary_ip_range.value.range_cidr
    }
  }
}