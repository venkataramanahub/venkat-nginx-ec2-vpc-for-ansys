variable "aws_region" {
  description = "AWS region to deploy the resources"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block details for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}