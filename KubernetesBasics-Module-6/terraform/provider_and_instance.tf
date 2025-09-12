provider "aws" {
  region = var.aws_region
}

# read your public key content
data "local_file" "pubkey" {
  filename = replace(var.public_key_path, "~", pathexpand("~"))
}

resource "aws_key_pair" "deployer" {
  key_name   = "razib-deployer-key"
  public_key = data.local_file.pubkey.content
}

# security group
resource "aws_security_group" "k8s_sg" {
  name        = "razib-k8s-sg"
  description = "Allow SSH and k8s ports"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # kube-apiserver (if needed)
  ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # NodePort range
  ingress {
    from_port   = 30000
    to_port     = 32767
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # allow http/https to access app (optional)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "k8s_node" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.k8s_sg.id]

  tags = {
    Name = "razib-k8s-node"
  }
}

resource "aws_eip" "k8s_eip" {
  instance = aws_instance.k8s_node.id
  vpc      = true
}
