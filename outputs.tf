output "lambda_function_name" {
  description = "Nome da Lambda criada"
  value       = module.lambda.function_name
}

output "lambda_function_arn" {
  description = "ARN da Lambda criada"
  value       = module.lambda.lambda_function_arn
}

output "cognito_user_pool_id" {
  description = "ID do Cognito User Pool"
  value       = module.cognito.user_pool_id
}

output "cognito_app_client_id" {
  description = "ID do App Client Cognito"
  value       = module.cognito.app_client_id
}

output "api_invoke_url" {
  description = "Endpoint base da API Gateway"
  value       = module.apigateway.invoke_url
}

output "api_execution_arn" {
  value = module.apigateway.execution_arn
}
