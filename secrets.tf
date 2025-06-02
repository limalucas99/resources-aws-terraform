resource "aws_secretsmanager_secret" "app_config" {
  name        = "my-appsettings-secret"
  description = "Configuração para aplicação C# via AWS Secrets Manager"
}

resource "aws_secretsmanager_secret_version" "app_config_version" {
  secret_id = aws_secretsmanager_secret.app_config.id

  secret_string = jsonencode({
    "Lambda:AuthUrl"    = "https://${aws_apigatewayv2_api.this.id}.execute-api.${var.region}.amazonaws.com/${aws_apigatewayv2_stage.this.name}"
    "Jwt:Authority"     = "https://cognito-idp.${var.region}.amazonaws.com/${aws_cognito_user_pool.this.id}"
    "Jwt:Audience"      = aws_cognito_user_pool_client.client.id
  })
}