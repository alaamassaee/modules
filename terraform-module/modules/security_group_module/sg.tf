resource "aws_security_group" "sg-allow-port-80" {
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = [22, 80]

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "sg-allow-port-80"
  }
}
