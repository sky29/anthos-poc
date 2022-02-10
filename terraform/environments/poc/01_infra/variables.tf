variable "project_id" {
  type          = string
  default       = ""
  description = "google cloud project id"
}

variable "google_cloud_apis" {
  type          = list(string)
  default       = []
  description = "google cloud apis - that needs to be enabled"
}

variable "disable_services_on_destroy" {
  type          = bool
  default       = false
  description = "google cloud apis should not be disabled while running terraform destory"
}

variable "vpc_name" {
  type          = string
  default       = ""
}

variable "subnet_name" {
  type          = string
  default       = ""
}

variable "region" {
  type          = string
  default       = ""
}

variable "ip_cidr_range" {
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

variable "cluster_name" {
  type          = string
  default       = ""
}

variable "is_regional" {
  type          = bool
  default       = false
}

variable "is_zonal" {
  type          = bool
  default       = true
}

variable "zone" {
  type          = string
  default       = ""
}

# variable "zones" {
#   type          = list(string)
#   default       = []
# }

variable "vpc_id" {
  type          = string
  default       = ""
}

variable "subnet_id" {
  type          = string
  default       = ""
}

variable "initial_node_count" {
  type          = number
  default       = 0
}

variable "k8s_version" {
  type          = string
  default       = ""
}

variable "node_pool_name" {
  type          = string
  default       = ""
}

variable "cluster_id" {
  type          = string
  default       = ""
}

variable "node_count" {
  type          = number
  default       = 0
}

variable "is_preemptible" {
  type          = bool
  default       = true
}

variable "machine_type" {
  type          = string
  default       = ""
}

variable "gke_hub_membership_id" {
  type          = string
  default       = ""
}
