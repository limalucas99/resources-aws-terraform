
module "cognito" {
  source = "./modules/cognito"
}

module "lambda" {
  source       = "./modules/lambda"
  user_pool_id = module.cognito.user_pool_id
  client_id    = module.cognito.client_id
  depends_on   = [module.cognito]
}

module "api-gateway" {
  source            = "./modules/api-gateway"
  lambda_invoke_arn = module.lambda.lambda_invoke_arn
  depends_on        = [module.lambda]
}

data "aws_caller_identity" "current" {}

resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = module.lambda.lambda_function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "arn:aws:execute-api:us-east-1:${data.aws_caller_identity.current.account_id}:${module.api-gateway.gw_rest_api_id}/*/${module.api-gateway.gw_http_method}${module.api-gateway.gw_resource_path}"
}

