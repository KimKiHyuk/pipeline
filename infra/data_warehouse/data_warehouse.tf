# Data warehouse
resource "google_bigquery_dataset" "bq-dwh" {
  dataset_id  = "warehouse"
  description = "dataset for warehouse"
  project     = var.project_id
  location    = local.region
  depends_on  = [google_project_service.data-warehouse-service]
}