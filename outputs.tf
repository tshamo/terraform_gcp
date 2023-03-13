output "bucket_name" {
  value = google_storage_bucket.bucket.self_link
}

output "nat_ip" {
  #value = google_compute_instance.my_instance.network_interface.nat_ip
  value = google_compute_instance.my_instance[*].network_interface.0.access_config.0.nat_ip
}


output "vm_name" {
  #value = google_compute_instance.my_instance.network_interface.nat_ip
  value = google_compute_instance.my_instance[*].name
}
