resource "aws_security_group" "p2_ec2_sg" {
  name        = "p2_ec2_sg"
  description = "Allow traffic from ALB only"
  vpc_id      = aws_vpc.p2_vpc.id



 egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "p2_alb_sg" {
  name        = "p2_alb_sg"
  description = "Allowing traffic from my laptop IP and EC2"
  vpc_id      = aws_vpc.p2_vpc.id

   ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



resource "aws_security_group_rule" "allow_alb_to_ec2" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.p2_ec2_sg.id
  source_security_group_id = aws_security_group.p2_alb_sg.id
}

