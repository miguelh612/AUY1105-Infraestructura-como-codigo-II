variable "prefix" {
  description = "Prefijo para el nombre del bucket S3"
  type        = string
}

variable "suffix" {
  description = "Sufijo para asegurar que el nombre del bucket sea único"
  type        = string
}