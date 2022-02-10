resource "google_gke_hub_feature" "gke_hub_feature_acm" {
  project = var.project_id
  name = "configmanagement"
  location = "global"
  provider = google-beta
}

resource "google_gke_hub_feature_membership" "gke_hub_feature_membership_acm" {
  project = var.project_id
  location = "global"
  feature = google_gke_hub_feature.gke_hub_feature_acm.name
  membership = var.gke_hub_membership_id
  configmanagement {
    version = "1.8.0"
    config_sync {
      source_format = "unstructured"
      git {
        sync_repo = "https://github.com/sky29/anthos-poc.git"
        sync_branch = "main"
        policy_dir = "configurations"
        secret_type = "none"
      }
    }
    policy_controller {
      enabled                    = true
      template_library_installed = true
      referential_rules_enabled  = true
    }
  }
  provider = google-beta
  depends_on = [
    google_gke_hub_feature.gke_hub_feature_acm
  ]
}