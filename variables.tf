#variable "google_compute_instance_name" {
#    type = string
#    default = "terra-instance-01"
#}

variable "vm_names" {
    type =  list(string)
    default = ["node-01", "red", "green"]
}

variable "google_compute_instance_machine_type" {
    type =  string
    default = "e2-micro"
}

variable google_compute_instance_zone {   
    type = string     
    default = "us-east1-a"
}

variable google_compute_instance_allow_stopping_for_update {
    type = bool
    default = true

}


variable google_compute_instance_count {
    type = number
    default = 2

}
