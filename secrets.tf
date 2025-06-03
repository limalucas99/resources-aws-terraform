resource "aws_secretsmanager_secret" "app_config" {
  name        = "my-appsettings-secret"
  description = "Configuração para aplicação C# via AWS Secrets Manager"
}

resource "aws_secretsmanager_secret_version" "app_config_version" {
  secret_id = aws_secretsmanager_secret.app_config.id

  secret_string = jsonencode({
    "Lambda:AuthUrl" = "https://${module.apigateway.rest_api_id}.execute-api.${var.aws_region}.amazonaws.com/${module.apigateway.stage_name}"
    "Jwt:Authority"  = "https://cognito-idp.${var.aws_region}.amazonaws.com/${module.cognito.user_pool_id}"
    "Jwt:Audience"   = module.cognito.app_client_id
  })
}
