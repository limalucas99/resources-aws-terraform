resource "aws_api_gateway_rest_api" "martiello_api" {
  name        = "MartielloAPI"
  description = "API utilizada para o TC da FIAP"
}

resource "aws_api_gateway_resource" "api-gateway-martiello" {
  rest_api_id = aws_api_gateway_rest_api.martiello_api.id
  parent_id   = aws_api_gateway_rest_api.martiello_api.root_resource_id
  path_part   = "auth" # Cria uma rota com esse nome
}

resource "aws_api_gateway_method" "api-method" {
  authorization = "NONE"
  http_method   = "POST"
  resource_id   = aws_api_gateway_resource.api-gateway-martiello.id
  rest_api_id   = aws_api_gateway_rest_api.martiello_api.id
}

resource "aws_api_gateway_integration" "api-integration" {
  rest_api_id             = aws_api_gateway_rest_api.martiello_api.id
  resource_id             = aws_api_gateway_resource.api-gateway-martiello.id
  http_method             = aws_api_gateway_method.api-method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.lambda_invoke_arn 
}

resource "aws_api_gateway_deployment" "api-deployment" {
  rest_api_id = aws_api_gateway_rest_api.martiello_api.id

  triggers = {
    redeployment = sha1(jsonencode([ # Faz com que o Terraform aguarde a criação de todos os recursos antes de criar o deployment
      aws_api_gateway_resource.api-gateway-martiello.id, # e também recrie o deployment quando esses recursos forem alterados
      aws_api_gateway_method.api-method.id,
      aws_api_gateway_integration.api-integration.id,
    ]))
  }

  lifecycle {
    create_before_destroy = true # Cria o novo recurso antes de destruir o antigo (Para evitar downtime)
  }
}

resource "aws_api_gateway_stage" "api-stage" {
  deployment_id = aws_api_gateway_deployment.api-deployment.id
  rest_api_id   = aws_api_gateway_rest_api.martiello_api.id
  stage_name    = "prod"
}