resource "google_gke_hub_feature" "gke_hub_feature" {
  name = "configmanagement"
  location = "global"
}

resource "google_gke_hub_feature_membership" "gke_hub_feature_membership" {
  location = "global"
  feature = google_gke_hub_feature.gke_hub_feature.name
  membership = var.gke_hub_membership_id
  configmanagement {
    version = "1.8.0"
    config_sync {
      git {
        sync_repo = "https://github.com/sky29/anthos-poc.git"
        sync_branch = "main"
        policy_dir = "configurations"
        secret_type = "none"
      }
    }
  }
}