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


