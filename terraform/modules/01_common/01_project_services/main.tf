resource "google_project_service" "project_services" {
  for_each                   = toset(var.google_cloud_apis)
  project                    = var.project_id
  service                    = each.value
  disable_on_destroy         = var.disable_services_on_destroy
}