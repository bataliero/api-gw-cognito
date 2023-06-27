output "id" {
    value = aws_apigatewayv2_api.api.id
}
output "stage_invoke_url" {
    value  = aws_apigatewayv2_stage.example.invoke_url
}

# id - API identifier.
# api_endpoint - 
# arn - ARN of the API.
# execution_arn - ARN prefix to be used in an aws_lambda_permission's source_arn attribute or in an aws_iam_policy to authorize access to the @connections API. See the Amazon API Gateway Developer Guide for details.
