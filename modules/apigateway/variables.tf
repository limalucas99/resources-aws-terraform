variable "api_name" {
  type        = string
  description = "Nome da API Gateway"
}

variable "api_description" {
  type        = string
  description = "Descrição da API"
  default     = ""
}

variable "lambda_invoke_arn" {
  type        = string
  description = "ARN para invocar a Lambda (de saída do módulo Lambda)"
}

variable "aws_region" {
  type = string
}

variable "stage_name" {
  type        = string
  description = "Nome do stage da API"
  default     = "dev"
}
