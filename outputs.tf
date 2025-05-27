output "api_url" {
  value = "https://${aws_api_gateway_rest_api.example.id}.execute-api.${var.region}.amazonaws.com/dev/hello"
}
