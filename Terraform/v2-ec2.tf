provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "travel-server" {
    ami = "ami-0440d3b780d96b29d"
    instance_type = "t2.micro"
    key_name = "Terraformkey"
    security_groups = ["travel-sg"]
}

resource "aws_security_group" "travel-sg" {
  name        = "travel-sg"
  description = "SSH access"

  ingress {
    description = "Ssh access"
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
      Name = "ssh-port"
    }
  }