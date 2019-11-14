# The customer gateway
resource "aws_customer_gateway" "the_customer_gateway" {
  bgp_asn    = var.remote_bgp_asn
  ip_address = var.remote_ip
  type       = "ipsec.1"

  tags = merge(
    var.tags,
    {
      "Name" = "VPN/IPSec Customer Gateway"
    },
  )
}
