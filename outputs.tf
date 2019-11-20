output "remote_gateway_configuration" {
  description = "The configuration information for the VPN connection's remote (non-AWS) gateway, in XML format."
  value       = aws_vpn_connection.the_vpn_connection.customer_gateway_configuration
}
