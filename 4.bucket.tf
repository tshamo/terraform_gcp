# resource "google_storage_bucket" "bucket" {
#   name          = "terraform-bucket-ftstate_andy12345"
#   force_destroy = false
#   location      = "US"
#   storage_class = "STANDARD"
#   versioning {
#     enabled = true
#   }
# }

# resource "google_storage_bucket" "bucket-app" {
#   name          = "terraform-bucket_andy12345"
#   location      = "US"
#   storage_class = "STANDARD"
# }