variable "billing_account" { 
  type = string
}

variable "org_id" { 
  type = string
}

variable "region" {
  type    = string
  default = "us-west1"
}

variable "zone_letter" {
  type        = string
  description = "Single letter to be appended to region to form zone"
  default     = "a"
}

variable "project_name" {
  type        = string
  default     = "GCE Image Builder"
}

variable "rng_seed" {
  type        = string
  default     = "666"
}
