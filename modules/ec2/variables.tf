variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "instance_key_name" {
  description = "The name of the EC2 key pair for SSH access"
  type        = string
}