variable "openapi_spec" {
  description = "value"
  type        = string
}
variable "name" {

}
variable "tags" {
  type        = map(string)
  description = "Tags for the resources"

}
variable "description" {

}
variable "enable_cloudwatch" {
  default = true
}

variable "domain_name" {}
variable "cert_arn" {}
