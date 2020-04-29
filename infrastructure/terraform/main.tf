locals {
  instance_name = "${var.db_name}-${random_id.name.hex}"
  generated_password = "${var.user_password}_${random_id.pass.hex}"
}

resource "google_sql_database_instance" "postgres" {
  name             = local.instance_name
  database_version = var.database_version
  region           = var.db_region

  settings {
    ip_configuration {
      ipv4_enabled    = true
      private_network = null
      require_ssl     = false

      authorized_networks {
        name  = "test-machine-ip"
        value = var.test_machine_ip
      }
    }

    tier              = var.tier
    disk_size         = var.disk_size
    replication_type  = var.replication_type
    activation_policy = var.activation_policy
  }
}

# Override postgres default user
resource "google_sql_user" "postgres" {
  name     = "postgres"
  host     = var.user_host
  password = local.generated_password
  instance = google_sql_database_instance.postgres.name
}

resource "google_sql_user" "admin" {
  name     = var.user_name
  host     = var.user_host
  password = local.generated_password
  instance = google_sql_database_instance.postgres.name
}
