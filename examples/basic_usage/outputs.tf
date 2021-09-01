output "remote_gateway_configuration" {
  description = "The configuration information for the VPN connection's remote (non-AWS) gateway, in XML format."
  value       = module.ipsec_tunnel.remote_gateway_configuration
}
