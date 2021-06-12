# subnet in vpc01

resource "aws_subnet" "pub1vpc1" {
  vpc_id            = aws_vpc.main1.id
  cidr_block        = "10.20.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "subnet1"
  }
}
# subnet in vpc02
resource "aws_subnet" "pub2vpc2" {
  vpc_id     = aws_vpc.main2.id
  cidr_block = "10.40.0.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "subnet2"
  }
}