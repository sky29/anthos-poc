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

variable "project_id" {
  type          = string
  default       = ""
}

variable "region" {
  type          = string
  default       = ""
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

variable "service_ip_range" {
  type          = string
  default       = ""
}

variable "pod_ip_range" {
  type          = string
  default       = ""
}