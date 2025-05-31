variable "bucket_name" {
  type        = string
  description = "Nome do bucket S3"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags para o bucket"
}
