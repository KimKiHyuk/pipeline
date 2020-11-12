variable "billing_id" {
  type = string
}

variable "project_id" {
  type = string
}

locals {
  region     = "us-west4"
  unique_id  = "daangn-3"
  access_id  = "rlgur41"
  billing_id = var.billing_id
  project_id = var.project_id
}