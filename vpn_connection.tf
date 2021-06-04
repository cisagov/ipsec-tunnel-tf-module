# The VPN connection
resource "aws_vpn_connection" "the_vpn_connection" {
  customer_gateway_id = aws_customer_gateway.the_customer_gateway.id
  static_routes_only  = var.static_routes_only
  tags = {
    "Name" = "VPN/IPSec Connection"
  }
  type           = "ipsec.1"
  vpn_gateway_id = aws_vpn_gateway.the_vpn_gateway.id
}

# Create routes for traffic that should be routed through the tunnel
resource "aws_vpn_connection_route" "the_vpn_route" {
  count = length(var.remote_cidr_blocks)

  destination_cidr_block = var.remote_cidr_blocks[count.index]
  vpn_connection_id      = aws_vpn_connection.the_vpn_connection.id
}
