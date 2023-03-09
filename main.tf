provider "google" {
    project     = "andys-learning-project-379419"
    credentials = file("../credentials.json")
    region      = "us-central1"
    zone        = "us-central1-c"
}

resource "google_compute_instance" "my_instance" {
    name         = "terra-instance-12"
    machine_type = "e2-micro"
    zone         = "us-east1-b"
    allow_stopping_for_update = true

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