terraform {
    required_version = ">= 0.13"
    required_providers {
        google = {
            source  = "hashicorp/google"
            version = "~> 4.0"
        }
    }
    # backend "local" {
    #     path = "./output/terraform.tfstate"
    # }
    backend "gcs" {
        bucket  = "tf-state-lab1-320219"
        prefix  = "terraform/state"
    }
}