
# Create a route for accepter
resource "aws_route" "accpter" {
  route_table_id            = aws_route_table.custom_route.id
  destination_cidr_block    ="10.40.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.peering_conne.id 
}

# Create a route for requester
resource "aws_route" "requester" {
  route_table_id            = aws_route_table.cus_route2.id
  destination_cidr_block    ="10.20.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.peering_conne.id 
}

