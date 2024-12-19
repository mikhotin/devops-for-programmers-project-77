variable "yandex_token" {
  description = "Yandex Cloud API token"
  type        = string
}

variable "yc_cloud_id" {
  description = "Cloud ID"
  type        = string
  default     = "b1g3sqbpoht6dtam7uui" // Значение по умолчанию ставится только тогда, когда оно имеет смысл / перенесем в ансибл
  sensitive   = true
}

variable "yc_folder_id" {
  description = "Folder ID"
  type        = string
  default     = "b1g6mghftatcnbkasa91" // Значение по умолчанию ставится только тогда, когда оно имеет смысл / перенесем в ансибл
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


