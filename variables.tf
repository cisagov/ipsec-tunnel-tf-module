# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "aws_availability_zone" {
  description = "The AWS availability zone where the Virtual Private Gateway is to be deployed (e.g. a, b, c, etc.)"
}

variable "aws_region" {
  description = "The AWS region where the Virtual Private Gateway is to be deployed (e.g. us-east-1)"
}

variable "remote_cidr_blocks" {
  type        = list(string)
  description = "A list of CIDR blocks associated with the remote (non-AWS) end of the tunnel (e.g. [192.168.11.0/24, 10.10.11.0/24])"
}

variable "remote_ip" {
  description = "The public IP of the remote (non-AWS) end of the tunnel (e.g. 1.2.3.4)"
}

variable "route_table_ids" {
  type        = list(string)
  description = "A list of ID corresponding to route tables that should route traffic through the VPN/IPSec gateway (e.g. [rtb-0123456789abcdef0, rtb-0123456789abcdef1])"
}

variable "vpc_id" {
  description = "The ID of the AWS VPC where the Virtual private Gateway is to be deployed (e.g. vpc-0123456789abcdef0)"
}


# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "remote_bgp_asn" {
  type        = number
  description = "The BGP ASN of the remote (non-AWS) end of the tunnel (e.g. 11111).  This value is not used if static_routes_only is true."
  default     = 65000
}

variable "static_routes_only" {
  type        = bool
  description = "A boolean value indicating whether the VPN connection uses static routes exclusively.  Static routes must be used for devices that don't support BGP."
  default     = true
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AWS resources created"
  default     = {}
}
