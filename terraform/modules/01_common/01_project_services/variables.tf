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