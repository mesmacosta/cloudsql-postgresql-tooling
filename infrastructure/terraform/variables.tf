variable "project_id" {
  description = "The ID of the project in which resources will be provisioned."
  type        = string
}

variable "test_machine_ip" {
  description = "IP of the machine that will be authorized to connect to Cloud SQL."
  type        = string
}

variable "tier" { default = "db-f1-micro" }
variable "db_name" { default = "postgres" }
variable "db_region" { default = "us-central1" }
variable "project_region" { default = "us-central1" }
variable "disk_size" { default = "20" }
variable "database_version" { default = "POSTGRES_11" }
variable "user_host" { default = "%" }
variable "user_name" { default = "admin" }
variable "user_password" { default = "MyPASSDB" }
variable "replication_type" { default = "SYNCHRONOUS" }
variable "activation_policy" { default = "always" }