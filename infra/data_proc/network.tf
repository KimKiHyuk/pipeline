resource "google_compute_network" "vpc" {
  name                    = "proc-vpc"
  auto_create_subnetworks = "true"
}

resource "google_compute_firewall" "default" {
  name    = "rlgur41-firewall"
  network = google_compute_network.vpc.name

  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}