provider "google" {
  project = var.project_id
  region  = local.region
}


resource "google_storage_bucket" "bucket" {
  name          = "rlgur41-dataproc-bucket"
  location      = local.region
  force_destroy = "true"
}

resource "google_dataproc_cluster" "cluster" {
  name   = "rlgur41-dataproc-cluster"
  region = local.region

  cluster_config {
    staging_bucket = google_storage_bucket.bucket.name

    master_config {
      num_instances = 3
      machine_type  = local.machine

      disk_config {
        boot_disk_type    = "pd-ssd"
        boot_disk_size_gb = 30
      }
    }

    worker_config {
      num_instances = 3
      machine_type  = local.machine

      disk_config {
        boot_disk_size_gb = 30
        num_local_ssds    = 1
      }
    }

    preemptible_worker_config {
      num_instances = 0
    }

    software_config {
      image_version = "1.3.14-deb9"

      override_properties = {
        "dataproc:dataproc.allow.zero.workers" = "true"
      }
    }

    gce_cluster_config {
      network = "proc-vpc"
    }

    # You can define multiple initialization_action blocks
    initialization_action {
      script      = "gs://dataproc-initialization-actions/stackdriver/stackdriver.sh"
      timeout_sec = 500
    }

    # initialization_action {
    #   script      = "gs://dataproc-initialization-actions/ganglia/ganglia.sh"
    #   timeout_sec = 500
    # }
    # Only needed for non-HA mode (master_num_instances < 3)
    # initialization_action {
    #   script      = "gs://dataproc-initialization-actions/zookeeper/zookeeper.sh"
    #   timeout_sec = 5000
    # }

    initialization_action {
      script      = "gs://dataproc-initialization-actions/docker/docker.sh"
      timeout_sec = 500
    }

    initialization_action {
      script      = "gs://dataproc-initialization-actions/livy/livy.sh"
      timeout_sec = 500
    }
    initialization_action {
      script      = "gs://dataproc-initialization-actions/kafka/kafka.sh"
      timeout_sec = 500
    }
  }

  depends_on = ["google_storage_bucket.bucket"]

  timeouts {
    create = "30m"
    delete = "30m"
  }
}
