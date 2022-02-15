resource "google_service_account" "gcp_node_pool_sa" {
  project      = var.project_id
  account_id   = var.gcp_node_pool_sa
  display_name = "GCP Node Pool SA"
}
resource "google_container_node_pool" "gcp_gke_cluster_node_pool_1" {
  name = var.node_pool_name

  project = var.project_id
  location = var.zone
  #node_locations = var.zones
  cluster = var.cluster_id
  node_count = var.node_count

  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }
  node_config {
    preemptible = var.is_preemptible
    machine_type = var.machine_type
    metadata = {
      disable-legacy-endpoints = "true"
    }

    service_account = google_service_account.gcp_node_pool_sa.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  lifecycle {
    ignore_changes = [
      initial_node_count,
      node_count,
      version
    ]
  }
}