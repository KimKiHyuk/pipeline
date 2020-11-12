provider "google" {
}

resource "google_project_service" "data-lake-service" {
  for_each = toset([
    "compute.googleapis.com",
    "bigquery.googleapis.com"
  ])
  service            = each.key
  project            = var.project_id
  disable_on_destroy = false
}

resource "google_project_service" "data-warehouse-service" {
  for_each = toset([
    "bigquery.googleapis.com"
  ])
  service            = each.key
  project            = var.project_id
  disable_on_destroy = false
}

resource "google_project_service" "data-marts-service" {
  for_each = toset([
    "bigquery.googleapis.com"
  ])
  service            = each.key
  project            = var.project_id
  disable_on_destroy = false
}

