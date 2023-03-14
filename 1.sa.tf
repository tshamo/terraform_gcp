
resource "google_service_account" "service_account" {
  # Create SA
  account_id   = "test-service-account"
  display_name = "Test SA"
}
resource "google_service_account_key" "service_account" {
  # Create SA key
  service_account_id = google_service_account.service_account.name
  public_key_type    = "TYPE_X509_PEM_FILE"
}
resource "local_file" "service_account" {
    # Download SA json locally
    content  = base64decode(google_service_account_key.service_account.private_key)
    filename = "../../serviceaccountKey.json"
}