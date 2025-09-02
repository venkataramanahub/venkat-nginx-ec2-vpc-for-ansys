terraform {
  backend "s3" {
    bucket         = "projects-tf-state-bucket"
    key            = "projects-tf-state-bucket/ansys/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state-locks-table"
  }
}