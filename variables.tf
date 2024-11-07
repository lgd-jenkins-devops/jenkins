variable "project_id" {
  description = "Google Cloud Project ID"
}

variable "region" {
  description = "Google Cloud Region"
  default     = "us-central1"
}

variable "vpc_name" {
  description = "VPC name"
}

variable "subnets" {
}

variable "account_id" {
}

variable "jenkins_role" {
  default     =  "roles/compute.admin"
}

variable "vms" {
}
variable "firewall_rules"{
}

variable "ssl" {
}