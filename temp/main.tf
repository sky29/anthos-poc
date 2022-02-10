
# enable required google cloud apis
module "enable_google_cloud_apis" {
    source                          = "../modules/01_project_services"
    project_id                      = var.project_id
    google_cloud_apis               = var.google_cloud_apis
    disable_services_on_destroy     = var.disable_services_on_destroy
}


# create google cloud service account
# module "create_google_cloud_sa" {
#     source                          = "../modules/02_service_account"
#     account_id                      = var.account_id
#     display_name                    = var.display_name
# }


# create network (vpc, subnets etc.)
module "create_network" {
    source                          = "../modules/03_network"
    project_id                      = var.project_id
    vpc                             = var.vpc
    subnet                          = var.subnet
    subnet_region                   = var.subnet_region
    subnet_cidr_range               = var.subnet_cidr_range
    secondary_ip_ranges             = var.secondary_ip_ranges
}


# create gke cluster
module "create_gke_cluster" {
    source                                      = "../modules/04_gke_cluster"
    cluster_name                                = var.cluster_name
    subnet_region                               = var.subnet_region
    project_id                                  = var.project_id
    initial_node_count                          = var.initial_node_count
    min_master_version                          = var.min_master_version

    vpc_id                                      = module.create_network.vpc_id
    subnet_id                                   = module.create_network.subnet_id
    service_ip_range                            = module.create_network.service_ip_range
    pod_ip_range                                = module.create_network.pod_ip_range
}


# create gke node pool
module "create_gke_node_pool" {
    source                                      = "../modules/05_gke_node_pool"
    project_id                                  = var.project_id
    cluster_id                                  = module.create_gke_cluster.cluster_id

    node_pool_name                              = var.node_pool_name
    node_pool_node_count                        = var.node_pool_node_count
    node_pool_node_config_preemptible           = var.node_pool_node_config_preemptible
    node_pool_node_config_machine_type          = var.node_pool_node_config_machine_type
}