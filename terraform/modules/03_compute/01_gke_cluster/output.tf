output "cluster_id" {
  value = var.is_regional ? google_container_cluster.gcp_gke_cluster_regional[0].id : google_container_cluster.gcp_gke_cluster_zonal[0].id
}