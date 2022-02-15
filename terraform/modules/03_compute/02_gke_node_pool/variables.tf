variable "node_pool_name" {
  type          = string
  default       = ""
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


variable "min_node_count" {
  type          = number
  default       = 1
}

variable "max_node_count" {
  type          = number
  default       = 3
}

variable "gcp_node_pool_sa" {
  type          = string
  default       = ""
}
