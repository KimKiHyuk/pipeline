# Sample IAM permission
module "project_iam_binding" {
  source   = "terraform-google-modules/iam/google//modules/projects_iam/"
  projects = [var.project_id]
  mode     = "additive"
  bindings = {
    # Bigquery 
    "roles/bigquery.admin" = ["user:${local.access_id}@gmail.com"]
    # GCS
    "roles/storage.admin" = ["user:${local.access_id}@gmail.com"]
    # Compute
    "roles/compute.admin" = ["user:${local.access_id}@gmail.com"]
  }
}