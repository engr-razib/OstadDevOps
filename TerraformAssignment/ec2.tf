# EC2 Instance
resource "aws_instance" "my_ec2" {
  ami           = "ami-08c40ec9ead489470" # Amazon Linux 2 AMI (us-east-1)
  instance_type = var.instance_type

  tags = {
    Name = var.ec2_tags_name
  }
}
