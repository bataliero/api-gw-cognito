
resource "aws_apigatewayv2_api" "api" {
  name          = var.name
  protocol_type = "HTTP"
  fail_on_warnings = true
  description = var.description
#   cors_configuration 
  body = var.openapi_spec
#   route_key =  ?
  tags = var.tags
#   target = ?
}
#   = templatefile("${path.module}/input.json", {
#     var_to_use_in_file = var.my_value
#   })



# # Define a resource for the API Gateway v2
# resource "aws_apigatewayv2_api" "example" {
#   name          = "example-api"
#   protocol_type = "HTTP"
#   # Use the openapi spec to define the GET method
  
#   # fail_on_warnings = true
#   body = jsonencode({
#     openapi = "3.0.1"
#     info = {
#       title   = "example-api"
#       version = "v1"
#     }
#     paths = {
#       "/example" = {
#         get = {
#           # Use the x-amazon-apigateway-integration extension to integrate with lambda function
#           x-amazon-apigateway-integration = {
#             type                    = "AWS_PROXY"
#             httpMethod              = "POST"
#             uri                     = "arn:aws:apigateway:eu-west-1:lambda:path/2015-03-31/functions/arn:aws:lambda:eu-west-1:011140424315:function:example/invocations"
#             payloadFormatVersion    = "2.0"
#             timeoutInMillis         = 29000
#           }
#           responses = {
#             default = {
#               description = "Default response for GET /example"
#             }
#           }
#         }
#       }
#     }
#   })
# }


# CloudWatch logging for API Gateway 

resource "aws_apigatewayv2_stage" "example" {
  api_id = aws_apigatewayv2_api.api.id
  name   = "v1"
  # deployment_id  = aws_apigatewayv2_deployment.example.id
  auto_deploy = true
}

resource "aws_apigatewayv2_domain_name" "domain_name" {
  domain_name = var.domain_name

  domain_name_configuration {
    certificate_arn = var.cert_arn 
    endpoint_type   = "REGIONAL"
    security_policy = "TLS_1_2"
  }
}

resource "aws_apigatewayv2_api_mapping" "example" {
  api_id      = aws_apigatewayv2_api.api.id
  domain_name = aws_apigatewayv2_domain_name.domain_name.id
  stage       = aws_apigatewayv2_stage.example.id
}


# resource "aws_apigatewayv2_api" "example" {
#   name                       = "example-websocket-api"
#   protocol_type              = "WEBSOCKET"
#   route_selection_expression = "request.body.action"
# }

# resource "aws_apigatewayv2_deployment" "example" {
#   api_id      = aws_apigatewayv2_api.api.id
#   description = "Example deployment"

#   lifecycle {
#     create_before_destroy = true
#   }
# }