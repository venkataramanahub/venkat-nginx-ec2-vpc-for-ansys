Terraform AWS Infrastructure:

This project uses Terraform to provision a simple and secure AWS infrastructure. The code is modular, well-documented, and follows best practices for a scalable cloud environment.

What's in this Project?

Network: A custom VPC with three public and three private subnets across different availability zones.
Security: An Internet Gateway for internet access and a security group to allow HTTP and SSH traffic to the EC2 instance.
Compute: An EC2 instance with Nginx installed and running on port 80.
State Management: A remote S3 backend to store the Terraform state file securely.


Follow these steps to deploy the infrastructure:

Configure AWS: Make sure you have the AWS CLI installed and configured with your credentials.

Note: Feel free to replace your instance_key_name on line 33 of main.tf (root) file with any of your existing keypair while deploying the infrastructure.

Initialize Terraform: This command sets up the project and downloads the required providers.

terraform init
Deploy Resources: This command creates all the resources in your AWS account.

terraform apply
Once the deployment is complete, you can get the public IP of your EC2 instance by running:

terraform output nginx_instance_public_ip








