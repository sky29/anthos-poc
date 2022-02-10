
# enable required google cloud apis
module "google_cloud_apis" {
    source = "../../../modules/01_common/01_project_services"
    project_id = var.project_id
    google_cloud_apis = var.google_cloud_apis
    disable_services_on_destroy = var.disable_services_on_destroy
}


# create network (vpc, subnets etc.)
module "network_vpc" {
    source = "../../../modules/02_network/01_vpc"
    vpc_name = var.vpc_name
    project_id = var.project_id
}

module "network_subnet_us_central1" {
    source = "../../../modules/02_network/02_subnet"
    subnet_name = var.subnet_name
    project_id = var.project_id
    vpc_id = module.network_vpc.vpc_id
    region = var.region
    ip_cidr_range = var.ip_cidr_range
    secondary_ip_ranges = var.secondary_ip_ranges
}


# create compute (gke cluster, node pool etc.)
module "compute_gke_cluster_zonal" {
    source = "../../../modules/03_compute/01_gke_cluster"
    cluster_name = var.cluster_name
    is_regional = var.is_regional
    is_zonal = var.is_zonal
    project_id = var.project_id
    region = var.region
    zone = var.zone
    initial_node_count = var.initial_node_count
    k8s_version = var.k8s_version

    vpc_id = module.network_vpc.vpc_id
    subnet_id = module.network_subnet_us_central1.subnet_id
    service_ip_range = module.network_subnet_us_central1.secondary_ip_ranges[0].range_name
    pod_ip_range = module.network_subnet_us_central1.secondary_ip_ranges[1].range_name
}

module "compute_gke_cluster_node_pool_1" {
    source = "../../../modules/03_compute/02_gke_node_pool"
    node_pool_name = var.node_pool_name
    project_id = var.project_id
    region = var.region
    zone = var.zone
    cluster_id = module.compute_gke_cluster_zonal.cluster_id

    node_count = var.node_count
    is_preemptible = var.is_preemptible
    machine_type = var.machine_type
}


# create anthos cluster OR register existing cluster with GKE Hub
module "gke_hub_membership" {
    source = "../../../modules/03_compute/03_gke_hub_membership"
    project_id = var.project_id
    gke_hub_membership_id = var.gke_hub_membership_id
    cluster_id = module.compute_gke_cluster_zonal.cluster_id
}


module "anthos_feature_acm" {
    source = "../../../modules/03_compute/04_anthos_feature_acm"
    project_id = var.project_id
    gke_hub_membership_id = var.gke_hub_membership_id
}