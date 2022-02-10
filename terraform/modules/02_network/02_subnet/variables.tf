variable "subnet_name" {
  type          = string
  default       = ""
}

variable "project_id" {
  type          = string
  default       = ""
}

variable "vpc_id" {
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
