
output "project_id" {
  value       = var.project_id
  description = "The project to run tests against"
}

output "name" {
  value       = local.instance_name
  description = "The name for Cloud SQL instance"
}

output "self_link" {
  description = "link for your sql database instance"
  value       = google_sql_database_instance.postgres.self_link
}

output "public_ip_address" {
  description = "Public ip address to connect to this Database"
  value       = google_sql_database_instance.postgres.public_ip_address
}

output "instance_id" {
  description = "Id of the Cloud SQL instance"
  value       = google_sql_database_instance.postgres.id
}

output "username" {
  description = "Username to connect to this Database"
  value       = google_sql_user.admin.name
}

output "password" {
  description = "Password to connect to this Database"
  value       = google_sql_user.admin.password
}

output "db_name" {
  value       = var.db_name
  description = "The name of the Database to connect to"
}

