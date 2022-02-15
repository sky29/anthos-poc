
project_id = "REPLACE_ME"
region = "us-central1"


# Google Cloud APIs
google_cloud_apis = [
    "compute.googleapis.com",
    "container.googleapis.com",
    "gkehub.googleapis.com",
    "anthosconfigmanagement.googleapis.com",
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "anthos.googleapis.com",
    "cloudtrace.googleapis.com",
    "meshca.googleapis.com",
    "meshtelemetry.googleapis.com",
    "meshconfig.googleapis.com",
    "iamcredentials.googleapis.com",
    "gkeconnect.googleapis.com",
    "monitoring.googleapis.com",
    "logging.googleapis.com"
]
disable_services_on_destroy = false


# Network Settings
vpc_name = "vpc-anthos-poc"
subnet_name = "snet-anthos-poc"
region = "us-central1"
ip_cidr_range = "10.2.0.0/16"
secondary_ip_ranges = [ 
    {range_name = "service-range", range_cidr = "192.168.1.0/24"}, 
    {range_name = "pod-range", range_cidr = "192.168.64.0/22"}
]


# GKE Cluster (VPC Native) - Zonal
cluster_name = "cluster-anthos-poc"
is_regional = false
is_zonal = true
zone = "us-central1-a"
#zones = ["us-central1-a"]
initial_node_count = 1
k8s_version = "1.21.5-gke.1802"
workload_metadata_config = "GKE_METADATA"


# GKE Cluster (VPC Native) - Node Pool
node_pool_name = "node-pool-1"
node_count = 1
is_preemptible = true
machine_type = "e2-medium"
min_node_count = 1
max_node_count = 5
gcp_node_pool_sa = "anthos-gcp-node-pool-sa"

# GKE Hub Membership
gke_hub_membership_id = "anthos-poc-gke-hub-membership"


# Enable Config Connector add-on on GKE Cluster
is_config_connector_enabled = true

gcp_sa = anthos-gcp-sa
k8s_ns = anthos-k8s-ns
k8s_sa_for_k8s_ns = anthos-k8s-sa