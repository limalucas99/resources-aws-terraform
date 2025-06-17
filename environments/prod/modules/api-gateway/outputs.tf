output "gw_rest_api_id" {
  value = aws_api_gateway_rest_api.martiello_api.id
}

output "gw_http_method" {
  value = aws_api_gateway_method.api-method.http_method
}

output "gw_resource_path" {
  value = aws_api_gateway_resource.api-gateway-martiello.path
}
