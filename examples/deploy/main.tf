provider "aws" {
  region = var.aws_region
  assume_role {
    role_arn     = var.default_role_arn
    session_name = "terraform-default"
  }
}

#-------------------------------------------------------------------------------
# Create a subnet inside a VPC.
#-------------------------------------------------------------------------------
resource "aws_vpc" "the_vpc" {
  cidr_block           = "10.75.1.0/24"
  enable_dns_hostnames = true
}

resource "aws_subnet" "the_subnet" {
  vpc_id            = aws_vpc.the_vpc.id
  cidr_block        = "10.75.1.0/24"
  availability_zone = "${var.aws_region}${var.aws_availability_zone}"
}

#-------------------------------------------------------------------------------
# Set up external access and routing in the VPC.
#-------------------------------------------------------------------------------

# The internet gateway for the VPC
resource "aws_internet_gateway" "the_igw" {
  vpc_id = aws_vpc.the_vpc.id
}

# Default route table
resource "aws_default_route_table" "the_route_table" {
  default_route_table_id = aws_vpc.the_vpc.default_route_table_id
}

# Route all external traffic through the internet gateway
resource "aws_route" "route_external_traffic_through_internet_gateway" {
  route_table_id         = aws_default_route_table.the_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.the_igw.id
}

#-------------------------------------------------------------------------------
# Configure the IPSec tunnel module.
#-------------------------------------------------------------------------------
module "ipsec_tunnel" {
  source = "../.."

  aws_region            = var.aws_region
  aws_availability_zone = var.aws_availability_zone
  remote_cidr_blocks    = var.remote_cidr_blocks
  remote_ip             = var.remote_ip
  route_table_ids       = var.route_table_ids
  vpc_id                = aws_vpc.the_vpc.id

  tags = var.tags
}
