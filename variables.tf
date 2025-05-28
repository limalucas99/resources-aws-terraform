variable "aws_region" {
  type        = string
  description = "Região AWS para deployment"
  default     = "us-east-1"
}
variable "lambda_function_name" { type = string }
variable "cognito_user_pool_name" { type = string }
variable "api_name"              { type = string }
variable "api_description"       { type = string }
