resource "google_service_account" "gcp_sa" {
  project      = var.project_id
  account_id   = var.gcp_sa
  display_name = "GCP SA bound to K8S SA - ${var.k8s_sa_for_k8s_ns}"
}

resource "kubernetes_service_account" "k8s_sa" {
  metadata {
    name = var.k8s_sa_for_k8s_ns
    namespace = var.k8s_ns
    annotations = {
      "iam.gke.io/gcp-service-account" = google_service_account.gcp_sa[0].email
    }
  }
}



# module "wi" {

#  source              =     "terraform-google-modules/kubernetes-engine/google//modules/workload-identity"
#   version             = "~> 16.0.1"
#   gcp_sa_name         = "cnrmsa"
#   cluster_name        = module.gke.name
#   name                = "cnrm-controller-manager"
#   location            = var.zone
#   use_existing_k8s_sa = true
#   annotate_k8s_sa     = false
#   namespace           = "cnrm-system"
#   project_id          = module.enabled_google_apis.project_id
#   roles               = ["roles/owner"]
# }