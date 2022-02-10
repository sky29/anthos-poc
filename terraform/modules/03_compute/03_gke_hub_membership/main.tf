resource "google_gke_hub_membership" "gke_hub_membership" {
  //provider = google
  project = var.project_id
  membership_id = var.gke_hub_membership_id
  endpoint {
    gke_cluster {
      resource_link = var.cluster_id
    }
  }
  authority {
    issuer = "https://container.googleapis.com/v1/${var.cluster_id}"
  }
}