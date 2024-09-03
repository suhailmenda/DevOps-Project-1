resource "aws_internet_gateway" "gw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "bastionInternetGateway"
  }
}

resource "aws_route_table" "example" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.cidr_block
    gateway_id = "local"
  }
  


  tags = {
    Name = var.name
  }
}
resource "aws_route" "r" {
  route_table_id            = aws_route_table.example.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw.id
}

