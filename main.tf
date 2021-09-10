terraform {
  required_version = ">= 1.0"
  required_providers {
    google = {
      source = "hashicorp/google"
      version = ">= 3.75"
    }
    random = {
     source = "hashicorp/random"
      version = ">= 3.1"
    }
  }
}

module "project" {
  source = "./project"

  billing_account = var.billing_account
  org_id = var.org_id
  project_name = var.project_name
  region = var.region
}

locals {
  project_id = split("/", module.project.id)[1]
}

module "apis" {
  source = "./apis"

  project_id = local.project_id
  region = var.region
}

module "build" {
  source = "./build"

  region = var.region
  zone_letter = var.zone_letter
  project_name = module.project.name
  project_number = module.project.number
  project_id = local.project_id
}

output "project_name" {
  value = module.project.name
}

output "project_id" {
  value = module.project.id
}

output "project_number" {
  value = module.project.number
}
