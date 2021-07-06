# The customer gateway
resource "aws_customer_gateway" "the_customer_gateway" {
  bgp_asn    = var.remote_bgp_asn
  ip_address = var.remote_ip
  tags = {
    "Name" = "VPN/IPSec Customer Gateway"
  }
  type = "ipsec.1"
}
