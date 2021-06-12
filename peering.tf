resource "aws_vpc_peering_connection" "peering_conne" {
  peer_vpc_id   = aws_vpc.main2.id
  vpc_id        = aws_vpc.main1.id
  auto_accept   = true

  tags = {
    Name = "VPC Peering between vpc1 and vpc2"
  }
}
