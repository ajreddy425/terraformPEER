resource "aws_instance" "myins2" {
  ami                         = "ami-0742b4e673072066f"
  subnet_id                   = aws_subnet.pub2vpc2.id
  instance_type               = "t2.micro"
  security_groups             = [aws_security_group.mysg2.id]
  key_name                    = "newkeypair"
  tags = {
    Name = "myinstance2"
  }
}
resource "aws_security_group" "mysg2" {
  name        = "mysg2"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main2.id

  ingress {
    description = "SSH"
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
    Name = "mysgdemo2"
  }
}

