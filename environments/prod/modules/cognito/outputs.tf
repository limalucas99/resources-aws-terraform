output "user_pool_id" {
  value = aws_cognito_user_pool.martiello_user_pool.id
}

output "client_id" {
  value = aws_cognito_user_pool_client.martiello_client.id
}
