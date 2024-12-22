variable "yandex_token" {
  description = "Yandex Cloud API token"
  type        = string
}

variable "yc_cloud_id" {
  description = "Cloud ID"
  type        = string
  sensitive   = true
}

variable "yc_folder_id" {
  description = "Folder ID"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_user" {
  description = "Database user"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "datadog_api_key" {
  description = "Datadog API key"
  type        = string
  sensitive   = true
}

variable "datadog_app_key" {
  description = "Datadog APP key"
  type        = string
  sensitive   = true
}

variable "ssh" {
  description = "SSH key"
  type        = string
  sensitive   = true
}


