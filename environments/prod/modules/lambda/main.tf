data "aws_iam_role" "lab_role" {
  name = "LabRole"
}

data "archive_file" "lambda_code" {
  type        = "zip"
  source_file = "${path.module}/empty-lambda/index.js"
  output_path = "${path.module}/lambda_function_payload.zip"
}

resource "aws_lambda_function" "tc_lambda" {
  filename      = "${path.module}/lambda_function_payload.zip"
  function_name = "tc-validate-client"
  role          = data.aws_iam_role.lab_role.arn
  handler       = "index.handler"

  source_code_hash = data.archive_file.lambda_code.output_base64sha256

  runtime = "nodejs18.x"

    environment {
    variables = {
      USER_POOL_ID = var.user_pool_id
      CLIENT_ID    = var.client_id
    }
  }
}


