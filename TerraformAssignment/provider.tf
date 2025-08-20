# AWS Provider Configuration

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-08c40ec9ead489470"
  instance_type = var.instance_type
}
