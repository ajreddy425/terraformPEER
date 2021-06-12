resource "aws_instance" "myins" {
  ami                         = "ami-0742b4e673072066f"
  subnet_id                   = aws_subnet.pub1vpc1.id
  instance_type               = "t2.micro"
  security_groups             = [aws_security_group.mysg1.id]
  associate_public_ip_address = true
  key_name                    = "newkeypair"

  tags = {
    Name = "myinstance1"
  }
}

resource "aws_security_group" "mysg1" {
  name        = "mysg1"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main1.id

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
    Name = "mysgdemo1"
  }
}