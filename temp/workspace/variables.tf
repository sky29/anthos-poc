# Global
variable "project_id" {
  type          = string
  default       = ""
}


# Service Account
variable "account_id" {
  type          = string
  default       = ""
}

variable "display_name" {
  type          = string
  default       = ""
}


# Google Cloud APIs
variable "google_cloud_apis" {
  type          = list(string)
  default       = []
}

variable "disable_services_on_destroy" {
  type          = bool
  default       = false
}


# Network Settings
variable "vpc" {
  type          = string
  default       = ""
}

variable "subnet" {
  type          = string
  default       = ""
}

variable "subnet_region" {
  type          = string
  default       = ""
}

variable "subnet_cidr_range" {
  type          = string
  default       = ""
}

variable "secondary_ip_ranges" {
  type = set(object({
    range_name     = string
    range_cidr     = string
  }))
  default       = []
}


# GKE - Cluster
variable "cluster_name" {
  type          = string
  default       = ""
}

variable "initial_node_count" {
  type          = number
  default       = 0
}

variable "min_master_version" {
  type          = string
  default       = ""
}



# GKE - Cluster - NodePool
variable "node_pool_name" {
  type          = string
  default       = ""
}

variable "node_pool_node_count" {
  type          = number
  default       = 0
}

variable "node_pool_node_config_preemptible" {
  type          = string
  default       = ""
}

variable "node_pool_node_config_machine_type" {
  type          = string
  default       = ""
}