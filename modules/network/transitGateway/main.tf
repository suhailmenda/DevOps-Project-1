resource "aws_ec2_transit_gateway" "example" {
  description = "example"
  tags = {
    Name = var.transitName
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "app" {
  subnet_ids         = var.appSubnetIds
  transit_gateway_id = aws_ec2_transit_gateway.example.id
  vpc_id             = var.appVPCId
  tags = {
    Name = "transitAppAttach"
  }
}
resource "aws_ec2_transit_gateway_vpc_attachment" "bastion" {
  subnet_ids         = var.bastionSubnetIds
  transit_gateway_id = aws_ec2_transit_gateway.example.id
  vpc_id             = var.bastionVPCId
  tags = {
    Name = "transitBastionAttach"
  }
}