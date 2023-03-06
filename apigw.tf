resource "aws_api_gateway_rest_api" "apiGW_App" {
  name = "API-GW App"
  description = "API-GW for pichincha bank"
}

resource "aws_api_gateway_resource" "apiGW_Resource_App" {
  rest_api_id = aws_api_gateway_rest_api.apiGW_App.id
  parent_id = aws_api_gateway_rest_api.apiGW_App.root_resource_id
  path_part = "API-GW-Resource App"
}

resource "aws_api_gateway_method" "apiGW_Method_App" {
  rest_api_id = aws_api_gateway_rest_api.apiGW_App.id
  resource_id = aws_api_gateway_resource.apiGW_Resource_App.id
  http_method = "POST"
  authorization = ""
}

resource "aws_api_gateway_integration" "apiGW_Integration_App" {
  rest_api_id = aws_api_gateway_rest_api.apiGW_App.id
  resource_id = aws_api_gateway_resource.apiGW_Resource_App.id
  http_method = aws_api_gateway_method.apiGW_Method_App
  integration_http_method = "POST"
  type = "HTTP"
  uri = aws_lambda_function.lambda_func_App.invoke_arn
}

resource "aws_api_gateway_deployment" "apiGW_Deploy_App" {
  rest_api_id = aws_api_gateway_rest_api.apiGW_App.id
  stage_name = "dev"
  depends_on = [
    aws_api_gateway_integration.apiGW_Integration_App
  ]
}