output "user_pool_id" {
  description = "ID do User Pool"
  value       = aws_cognito_user_pool.this.id
}

output "app_client_id" {
  description = "ID do App Client"
  value       = aws_cognito_user_pool_client.client.id
}
