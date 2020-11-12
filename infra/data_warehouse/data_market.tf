# Data warehouse
resource "google_bigquery_dataset" "bq-market" {
  dataset_id  = "market"
  description = "dataset for data market"
  project     = var.project_id
  location    = local.region
  depends_on  = [google_project_service.data-marts-service]
}