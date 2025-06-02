output "rest_api_id" {
  value       = aws_api_gateway_rest_api.this.id
  description = "ID da API Gateway"
}

output "invoke_url" {
  value = "https://${aws_api_gateway_rest_api.this.id}.execute-api.${var.aws_region}.amazonaws.com/${var.stage_name}"
}

output "execution_arn" {
  value = aws_api_gateway_rest_api.this.execution_arn
}

output "stage_name" {
  value = aws_api_gateway_stage.stage.stage_name
}
