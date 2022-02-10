
# Common
project_id = "lab1-320219"


# Common - Google Cloud APIs
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
vpc                             = "test-vpc"
subnet                          = "test-snet"
subnet_region                   = "us-central1"
subnet_cidr_range               = "10.2.0.0/16"
secondary_ip_ranges             = [ 
    {range_name = "service-range", range_cidr = "192.168.1.0/24"}, 
    {range_name = "pod-range", range_cidr = "192.168.64.0/22"}
]


# GKE VPC Native Cluster
cluster_name                    = "cluster-test"
initial_node_count              = 1
min_master_version              = "1.21.5-gke.1802"


# GKE VPC Native Cluster - Node Pool
node_pool_name                                              = "node-pool-test"
node_pool_node_count                                        = 1
node_pool_node_config_preemptible                           = true
node_pool_node_config_machine_type                          = "e2-medium"