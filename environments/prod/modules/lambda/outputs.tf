output "lambda_invoke_arn" {
  value = aws_lambda_function.tc_lambda.invoke_arn
}

output "lambda_function_name" {
  value = aws_lambda_function.tc_lambda.function_name
}