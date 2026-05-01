provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "chat_sg_2" {
  name   = "chat-sg-2"
  vpc_id = "vpc-06a676484538562b8"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
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

resource "aws_instance" "chat_server" {
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t3.micro"
  key_name      = "chat-key"

  vpc_security_group_ids = [aws_security_group.chat_sg_2.id]

  tags = {
    Name = "ChatServer"
  }
}