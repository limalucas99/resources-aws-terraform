variable "function_name" {
  description = "Nome da função Lambda"
  type        = string
}
variable "handler" {
  description = "Handler da Lambda (por ex: index.handler)"
  type        = string
  default     = "index.handler"
}

variable "runtime" {
  description = "Runtime da Lambda"
  type        = string
  default     = "nodejs18.x"
}

variable "api_gateway_execution_arn" {
  type        = string
  description = "ARN de execução do API Gateway para permitir invocar a lambda"
}

variable "role_arn" {
  type        = string
  description = "ARN da role que será atribuída à Lambda (ex: LabRole do AWS Academy)"
}

