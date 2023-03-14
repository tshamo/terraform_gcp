
resource "google_compute_instance" "my_instance" {
  for_each = {
    "vm1" = { app = 1, zone = "us-east1-d" }
    "vm2" = { app = 2, zone = "us-east1-b" }
    "vm3" = { app = 3, zone = "us-east1-c" }
  }


  #count                     = var.google_compute_instance_count
  #name                      = "core-app-${count.index + 1}"
  name         = "dev-app-${each.value.app}"
  machine_type = var.google_compute_instance_machine_type
  #zone                      = var.google_compute_instance_zone
  zone                      = each.value.zone
  allow_stopping_for_update = var.google_compute_instance_allow_stopping_for_update

  depends_on = [
    #explicit dependecny - this actually is not required for this case, but just as an example
    google_compute_subnetwork.subnetwork-ipv4-terra
  ]

  labels = {
    env = "prod"
    app = "core"
  }

  tags = ["web", "dev"]

  metadata_startup_script = file("/Users/tshamo/centos_httpd.sh")

  scheduling {
    preemptible       = true
    automatic_restart = false
  }


  boot_disk {
    initialize_params {
      image = "centos-7-v20230306"
    }
  }

  network_interface {
    network = "default"
    access_config {
      //necessary even empty

    }
  }
}

resource "google_compute_firewall" "default" {
  name    = "terra-gcp-firewall"
  network = google_compute_network.default.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_tags = ["web"]
}

resource "google_compute_network" "default" {
  name = "terra-gcp-network"
}
