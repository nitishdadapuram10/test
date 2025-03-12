resource "aws_instance" "p2_ec2" {
  ami           = "ami-0d0f28110d16ee7d6"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.p2_private_subnet.id
  vpc_security_group_ids = [aws_security_group.p2_ec2_sg.id]


  user_data = <<-EOF
              #!/bin/bash
              sudo yum install httpd -y
              echo "Hi" | sudo tee /var/www/html/index.html
              sudo systemctl start httpd
              sudo systemctl enable httpd
              EOF

  tags = {
    Name = "PrivateEC2_P2"
  }
}

resource "aws_instance" "p2_ec2_2" {
  ami           = "ami-0d0f28110d16ee7d6"
  instance_type = "t2.micro"
  vpc_id   = aws_vpc.p2_vpc.id


  user_data = <<-EOF
              #!/bin/bash
              sudo yum install httpd -y
              echo "Hi" | sudo tee /var/www/html/index.html
              sudo systemctl start httpd
              sudo systemctl enable httpd
              EOF


}
