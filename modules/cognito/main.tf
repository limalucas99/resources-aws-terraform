resource "aws_cognito_user_pool" "this" {
  name = var.user_pool_name
}

resource "aws_cognito_user_pool_client" "client" {
  name             = "${var.user_pool_name}-client"
  user_pool_id     = aws_cognito_user_pool.this.id
  generate_secret  = false

  explicit_auth_flows = [
    "ADMIN_NO_SRP_AUTH",
    "ALLOW_REFRESH_TOKEN_AUTH"
  ]

  prevent_user_existence_errors = "ENABLED"
}

