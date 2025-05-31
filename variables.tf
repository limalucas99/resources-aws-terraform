variable "aws_region" {
  type        = string
  description = "Região AWS para deployment"
  default     = "us-east-1"
}
variable "lambda_function_name" { type = string }
variable "cognito_user_pool_name" { type = string }
variable "api_name"              { type = string }
variable "api_description"       { type = string }

variable "s3_bucket_name" {
  type        = string
  description = "Nome do bucket S3"
}

variable "default_tags" {
  type        = map(string)
  default     = {
    Projeto     = "Infraestrutura Terraform"
    Gerenciado  = "Terraform"
    Ambiente    = "Dev"
  }
}
