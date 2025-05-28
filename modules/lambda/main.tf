data "aws_caller_identity" "current" {}

data "archive_file" "empty_zip" {
  type        = "zip"
  source_dir  = "${path.module}/empty-lambda"
  output_path = "${path.module}/empty.zip"
}


resource "aws_lambda_function" "this" {
  function_name = var.function_name
  runtime       = var.runtime
  handler       = var.handler
  # role          = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/LabRole"
  role          = var.role_arn 
  filename         = data.archive_file.empty_zip.output_path
  source_code_hash = data.archive_file.empty_zip.output_base64sha256
}

resource "aws_lambda_permission" "apigw_invoke" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = var.api_gateway_execution_arn
}
