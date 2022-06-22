resource "aws_security_group" "ssh-y-ping" {
  name_prefix = "${var.prefijo}-ssh-y-ping"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }

  ingress {
    from_port = -1
    to_port   = -1
    protocol  = "icmp"
    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }
}

