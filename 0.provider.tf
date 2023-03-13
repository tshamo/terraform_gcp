terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.56.0"
    }
  }
}
provider "google" {
  project     = "andys-learning-project-379419"
  credentials = file("../credentials.json")
}
