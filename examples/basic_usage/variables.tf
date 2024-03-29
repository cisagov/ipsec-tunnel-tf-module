# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "aws_availability_zone" {
  type        = string
  description = "The AWS availability zone where the Virtual Private Gateway is to be deployed (e.g. a, b, c, etc.)."
}

variable "aws_region" {
  type        = string
  description = "The AWS region where the Virtual Private Gateway is to be deployed (e.g. us-east-1)."
}

variable "default_role_arn" {
  type        = string
  description = "The ARN of the role to assume for the default provider (e.g. arn:aws:iam::123456789abc:role/MyDefaultRole)."
}

variable "remote_cidr_blocks" {
  type        = list(string)
  description = "A list of CIDR blocks associated with the remote (non-AWS) end of the tunnel (e.g. [192.168.11.0/24, 10.10.11.0/24])."
}

variable "remote_ip" {
  type        = string
  description = "The public IP of the remote (non-AWS) end of the tunnel (e.g. 1.2.3.4)."
}

variable "route_table_ids" {
  type        = list(string)
  description = "A list of ID corresponding to route tables that should route traffic through the VPN/IPSec gateway (e.g. [rtb-0123456789abcdef0, rtb-0123456789abcdef1])."
}

variable "vpc_id" {
  type        = string
  description = "The ID of the AWS VPC where the Virtual private Gateway is to be deployed (e.g. vpc-0123456789abcdef0)."
}


# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AWS resources created."
  default     = {}
}
