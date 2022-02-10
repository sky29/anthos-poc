resource "google_container_node_pool" "gcp_gke_cluster_node_pool_1" {
  name = var.node_pool_name

  project = var.project_id
  location = var.zone
  #node_locations = var.zones
  cluster = var.cluster_id
  node_count = var.node_count

  node_config {
    preemptible = var.is_preemptible
    machine_type = var.machine_type

    # Refer: https://developers.google.com/identity/protocols/oauth2/scopes
    # service_account = google_service_account.service_account.email
    # oauth_scopes    = [
    #   "https://www.googleapis.com/auth/cloud-platform"
    # ]
  }
}