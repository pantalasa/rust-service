terraform {
  required_version = ">= 1.4.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

resource "aws_security_group" "rust_alb" {
  name        = "pantalasa-rust-alb"
  description = "Allow inbound HTTP/HTTPS to the rust service ALB"

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

resource "aws_lb" "rust_public" {
  name               = "pantalasa-rust-public"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.rust_alb.id]
  subnets            = ["subnet-aaaa1111", "subnet-bbbb2222"]

  enable_deletion_protection = false
}
