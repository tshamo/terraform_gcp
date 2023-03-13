resource "google_storage_bucket" "bucket" {
  name          = "terraform-bucket-test-andy12345"
  location      = "us-east1"
  storage_class = "STANDARD"
}