# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "aws_availability_zone" {
  description = "The AWS availability zone where the Virtual Private Gateway is to be deployed (e.g. a, b, c, etc.)."
  nullable    = false
  type        = string
}

variable "aws_region" {
  description = "The AWS region where the Virtual Private Gateway is to be deployed (e.g. us-east-1)."
  nullable    = false
  type        = string
}

variable "default_role_arn" {
  description = "The ARN of the role to assume for the default provider (e.g. arn:aws:iam::123456789abc:role/MyDefaultRole)."
  nullable    = false
  type        = string
}

variable "remote_cidr_blocks" {
  description = "A list of CIDR blocks associated with the remote (non-AWS) end of the tunnel (e.g. [192.168.11.0/24, 10.10.11.0/24])."
  nullable    = false
  type        = list(string)
}

variable "remote_ip" {
  description = "The public IP of the remote (non-AWS) end of the tunnel (e.g. 1.2.3.4)."
  nullable    = false
  type        = string
}

variable "route_table_ids" {
  description = "A list of ID corresponding to route tables that should route traffic through the VPN/IPSec gateway (e.g. [rtb-0123456789abcdef0, rtb-0123456789abcdef1])."
  nullable    = false
  type        = list(string)
}

variable "vpc_id" {
  description = "The ID of the AWS VPC where the Virtual private Gateway is to be deployed (e.g. vpc-0123456789abcdef0)."
  nullable    = false
  type        = string
}


# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "tags" {
  default     = {}
  description = "Tags to apply to all AWS resources created."
  nullable    = false
  type        = map(string)
}
