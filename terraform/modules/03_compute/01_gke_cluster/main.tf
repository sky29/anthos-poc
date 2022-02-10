resource "google_container_cluster" "gcp_gke_cluster_regional" {
  name = var.cluster_name
  count = var.is_regional ? 1 : 0
  
  project = var.project_id
  location = var.region
  # node_locations = var.zones
  network = var.vpc_id
  subnetwork = var.subnet_id

  initial_node_count = var.initial_node_count
  min_master_version = var.k8s_version
  remove_default_node_pool = true

  ip_allocation_policy {
    services_secondary_range_name = var.service_ip_range
    cluster_secondary_range_name = var.pod_ip_range
  }

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }
}


resource "google_container_cluster" "gcp_gke_cluster_zonal" {
  name = var.cluster_name
  count = var.is_zonal ? 1 : 0

  project = var.project_id
  location = var.zone
  network = var.vpc_id
  subnetwork = var.subnet_id

  initial_node_count = var.initial_node_count
  min_master_version = var.k8s_version
  remove_default_node_pool = true

  ip_allocation_policy {
    services_secondary_range_name = var.service_ip_range
    cluster_secondary_range_name = var.pod_ip_range
  }

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }
}