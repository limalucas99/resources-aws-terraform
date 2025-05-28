output "function_name" {
  description = "Nome gerado para a função Lambda"
  value       = aws_lambda_function.this.function_name
}

output "lambda_function_arn" {
  description = "ARN da função Lambda criada"
  value       = aws_lambda_function.this.arn
}
