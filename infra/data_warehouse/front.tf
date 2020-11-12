resource "google_compute_network" "vpc-network" {
  project    = var.project_id
  name       = "vpc-network"
  depends_on = [google_project_service.data-lake-service]
}

# 최앞단 서비스 주소
resource "google_compute_address" "orchestration-ip-static" {
  project    = var.project_id
  region     = local.region
  name       = "${local.unique_id}-external-ip"
  depends_on = [google_project_service.data-lake-service]
}

# 최앞단 서비스
resource "google_compute_instance" "orchestration" {
  project      = var.project_id
  zone         = "${local.region}-a"
  name         = "orchestration"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "ubuntu-2004-focal-v20200701"
    }
  }
  network_interface {
    network = google_compute_network.vpc-network.name
    access_config {
      nat_ip = google_compute_address.orchestration-ip-static.address
    }
  }
  depends_on = [google_project_service.data-lake-service, google_compute_address.orchestration-ip-static, google_compute_network.vpc-network]
}

