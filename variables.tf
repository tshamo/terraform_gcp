#variable "google_compute_instance_name" {
#    type = string
#    default = "terra-instance-01"
#}

variable "project_id" {
  type    = string
  default = "andys-learning-project-379419"
}

variable "google_compute_instance_machine_type" {
  type    = string
  default = "e2-micro"
}

variable "google_compute_instance_zone" {
  type    = string
  default = "us-east1-a"
}

variable "google_compute_instance_allow_stopping_for_update" {
  type    = bool
  default = true

}


variable "google_compute_instance_count" {
  type    = number
  default = 2

}

variable "rolesList" {
  type    = list(string)
  default = ["roles/storage.admin", "roles/pubsub.admin", "roles/compute.admin"]
}
