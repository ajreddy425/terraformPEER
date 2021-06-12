# creation of internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main1.id

  tags = {
    Name = "myigw1"
  }
}

# creation of route table

resource "aws_route_table" "custom_route" {
  vpc_id = aws_vpc.main1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }


  tags = {
    Name = "mycustomroute"
  }
}

# public sub asso

resource "aws_route_table_association" "pubasso" {
  subnet_id      = aws_subnet.pub1vpc1.id
  route_table_id = aws_route_table.custom_route.id
}

# route table for vpc2
resource "aws_route_table" "cus_route2" {
  vpc_id = aws_vpc.main2.id
  tags = {
    Name = "mycus_route2"
  }
}

# pub2 asso

resource "aws_route_table_association" "pub1asso" {
  subnet_id      = aws_subnet.pub2vpc2.id
  route_table_id = aws_route_table.cus_route2.id
}