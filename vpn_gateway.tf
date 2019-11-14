# The virtual private gateway instance
resource "aws_vpn_gateway" "the_vpn_gateway" {
  availability_zone = "${var.aws_region}${var.aws_availability_zone}"

  tags = merge(
    var.tags,
    {
      "Name" = "VPN/IPSec Gateway"
    },
  )
}

# Attach the VPN gateway to the VPC
resource "aws_vpn_gateway_attachment" "vpn_vpc_attachment" {
  vpc_id         = var.vpc_id
  vpn_gateway_id = aws_vpn_gateway.the_vpn_gateway.id
}

# Automatically propagate routes between the VPN gateway and the
# necessary route tables
resource "aws_vpn_gateway_route_propagation" "the_route_propagation" {
  count = length(var.route_table_ids)

  vpn_gateway_id = aws_vpn_gateway.the_vpn_gateway.id
  route_table_id = var.route_table_ids[count.index]
}
