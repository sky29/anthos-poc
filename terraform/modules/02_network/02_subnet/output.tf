output "subnet_id" {
  value = google_compute_subnetwork.gcp_subnet.id
}

output "secondary_ip_ranges" {
  value = {for k, v in google_compute_subnetwork.gcp_subnet.secondary_ip_range: k => v}
}

# output "service_ip_range" {
#   value = google_compute_subnetwork.gcp_subnet.secondary_ip_range["targetgroup1"].range_name
# }

# output "pod_ip_range" {
#   value = google_compute_subnetwork.gcp_subnet.secondary_ip_range.1.range_name
# }