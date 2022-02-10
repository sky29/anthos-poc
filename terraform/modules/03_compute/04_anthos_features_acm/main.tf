resource "google_gke_hub_feature" "gke_hub_feature" {
  name = "configmanagement"
  location = "global"
}

resource "google_gke_hub_feature_membership" "gke_hub_feature_membership" {
  location = "global"
  feature = google_gke_hub_feature.gke_hub_feature.name
  membership = google_gke_hub_membership.gke_hub_membership.membership_id
  configmanagement {
    version = "1.8.0"
    config_sync {
      git {
        sync_repo = "https://github.com/terraform-google-modules/terraform-google-kubernetes-engine.git"
        sync_branch = "master"
        policy_dir = "examples/acm-terraform-blog-part1/config-root"
        secret_type = "none"
      }
    }
  }
}