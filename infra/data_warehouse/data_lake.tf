# GCS resources
resource "google_storage_bucket" "gcs-data-lake-abuse-log" {
  name          = "${var.project_id}-abuse"
  project       = var.project_id
  location      = local.region
  force_destroy = true
  storage_class = "STANDARD"
}

resource "google_storage_bucket" "gcs-data-lake-user" {
  name          = "${var.project_id}-daangn-log"
  project       = var.project_id
  location      = local.region
  force_destroy = true
  storage_class = "STANDARD"
}