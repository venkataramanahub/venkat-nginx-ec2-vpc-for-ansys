output "nginx_instance_public_ip" {
  description = "The public IP address of the Nginx EC2 instance."
  value       = module.ec2.instance_public_ip
}

output "public_subnet_ids" {
  description = "A list of the public subnet IDs."
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "A list of the private subnet IDs."
  value       = module.vpc.private_subnet_ids
}

output "vpc_id" {
  description = "The ID of the main VPC."
  value       = module.vpc.vpc_id
}