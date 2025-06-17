resource "aws_cognito_user_pool" "martiello_user_pool" {
  name = "Martiello-UserPool"

  password_policy {
    minimum_length    = 8
    require_uppercase = true
    require_lowercase = true
    require_numbers   = true
    require_symbols   = true
  }

  auto_verified_attributes = ["email"]

  schema {
    name                     = "cpf"
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true
    required                 = false

    string_attribute_constraints {
      min_length = 11
      max_length = 11
    }
  }
}


resource "aws_cognito_user_pool_client" "martiello_client" {
  name         = "martiello-client"
  user_pool_id = aws_cognito_user_pool.martiello_user_pool.id

  explicit_auth_flows = [
    "ALLOW_USER_PASSWORD_AUTH",
    "ALLOW_REFRESH_TOKEN_AUTH",
    "ALLOW_USER_SRP_AUTH",
    "ALLOW_CUSTOM_AUTH"
  ]

  prevent_user_existence_errors = "ENABLED"
  generate_secret               = false
}


