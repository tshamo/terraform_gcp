provider "google" {
    project     = "andys-learning-project-379419"
    credentials = file("../credentials.json")
}

resource "google_compute_instance" "my_instance" {
    count        = var.google_compute_instance_count
    name         = "terra-vm-${count.index+1}"
    machine_type = var.google_compute_instance_machine_type
    zone         = var.google_compute_instance_zone
    allow_stopping_for_update = var.google_compute_instance_allow_stopping_for_update

    labels = {
        env = "prod"
        app = "core"
    }

    #tags = ["test1", "test2"]

    metadata_startup_script =  file("/Users/tshamo/centos_httpd.sh")

scheduling {
        preemptible = true
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