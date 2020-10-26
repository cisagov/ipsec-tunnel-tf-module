# Create an IPSec tunnel into an AWS VPC #

## Usage ##

To run this example you need to execute the `terraform init` command
followed by the `terraform apply` command.

Note that this example may create resources which cost money. Run
`terraform destroy` when you no longer need these resources.

## Requirements ##

No requirements.

## Providers ##

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws_availability_zone | The AWS availability zone where the Virtual Private Gateway is to be deployed (e.g. a, b, c, etc.) | `string` | n/a | yes |
| aws_region | The AWS region where the Virtual Private Gateway is to be deployed (e.g. us-east-1) | `string` | n/a | yes |
| remote_cidr_blocks | A list of CIDR blocks associated with the remote (non-AWS) end of the tunnel (e.g. [192.168.11.0/24, 10.10.11.0/24]) | `list(string)` | n/a | yes |
| remote_ip | The public IP of the remote (non-AWS) end of the tunnel (e.g. 1.2.3.4) | `string` | n/a | yes |
| route_table_ids | A list of ID corresponding to route tables that should route traffic through the VPN/IPSec gateway (e.g. [rtb-0123456789abcdef0, rtb-0123456789abcdef1]) | `list(string)` | n/a | yes |
| tags | Tags to apply to all AWS resources created | `map(string)` | `{}` | no |
| vpc_id | The ID of the AWS VPC where the Virtual private Gateway is to be deployed (e.g. vpc-0123456789abcdef0) | `string` | n/a | yes |

## Outputs ##

| Name | Description |
|------|-------------|
| remote_gateway_configuration | The configuration information for the VPN connection's remote (non-AWS) gateway, in XML format. |
