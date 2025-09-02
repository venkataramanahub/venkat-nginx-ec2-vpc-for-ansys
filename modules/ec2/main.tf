resource "aws_security_group" "ansys-security-group" {
  name        = "ansys-security-group"
  description = "Allow HTTP and SSH inbound traffic(optional)"
  vpc_id      = var.vpc_id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "ansys-internet-ssh-access"
  }
}

resource "aws_instance" "nginx" {
  ami                         = "ami-00a929b66ed6e0de6"
  instance_type               = "t2.micro"
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.ansys-security-group.id]
  key_name                    = var.instance_key_name
  user_data                   = <<-EOT
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y nginx
              sudo systemctl start nginx
              sudo systemctl enable nginx
              EOT
  tags = {
    Name = "ansys-nginx-instance"
  }
}