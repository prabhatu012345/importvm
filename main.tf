provider "google" {
  credentials = file("key.json")
  project     = "gcp-terraform-dem"
  zone = "us-west4-b"
}

resource "google_compute_instance" "importvm" {
  # Define your GCP VM configuration here
  machine_type = "e2-medium"
  name = "importvm"
  boot_disk {
    initialize_params {
      image = "debian-12-bookworm-v20240110"
    }
  }
  network_interface {
    network = "default"
    subnetwork = "default"
    network_ip = "10.182.0.5"
    access_config {
      nat_ip = "34.16.149.253"
      network_tier = "PREMIUM"
    }
  }
  service_account {
    email = "670710487462-compute@developer.gserviceaccount.com"
    scopes = [
                  "https://www.googleapis.com/auth/devstorage.read_only",
                  "https://www.googleapis.com/auth/logging.write",
                  "https://www.googleapis.com/auth/monitoring.write",
                  "https://www.googleapis.com/auth/service.management.readonly",
                  "https://www.googleapis.com/auth/servicecontrol",
                  "https://www.googleapis.com/auth/trace.append"
                ]
  }
}
