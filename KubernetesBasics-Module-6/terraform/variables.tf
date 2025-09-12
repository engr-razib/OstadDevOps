variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "instance_type" {
  default = "t3.medium"
}

variable "public_key_path" {
  description = "Path to your SSH public key (e.g. ~/.ssh/id_rsa.pub)"
  default     = "~/.ssh/id_rsa.pub"
}

# IMPORTANT: set a valid AMI for your region (Ubuntu 22.04 etc.)
variable "ami_id" {
  description = "AMI ID to use for EC2 (Ubuntu 22.04 recommended)"
  default     = "ami-jsexpertdev@gmail.com"
}
