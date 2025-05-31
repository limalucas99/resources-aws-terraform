data "aws_caller_identity" "current" {}

# Módulo Lambda: ZIP vazio + função
module "lambda" {
  source        = "./modules/lambda"
  function_name = var.lambda_function_name
  handler           = "index.handler"
  runtime           = "nodejs18.x"
  role_arn          = data.aws_iam_role.lab_role.arn
  api_gateway_execution_arn = module.apigateway.execution_arn
}

module "cognito" {
  source          = "./modules/cognito"
  user_pool_name  = var.cognito_user_pool_name
}

module "apigateway" {
  source          = "./modules/apigateway"
  api_name        = var.api_name
  api_description = var.api_description
  lambda_invoke_arn = module.lambda.lambda_function_arn
  aws_region      = var.aws_region
  stage_name        = "dev" # mesmo que você não use, é obrigatório
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = var.s3_bucket_name
  tags        = var.default_tags
}

