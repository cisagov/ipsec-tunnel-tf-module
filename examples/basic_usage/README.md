# Create an IPSec tunnel into an AWS VPC #

## Usage ##

To run this example you need to execute the `terraform init` command
followed by the `terraform apply` command.

Note that this example may create resources which cost money. Run
`terraform destroy` when you no longer need these resources.

## Requirements ##

| Name | Version |
|------|---------|
| terraform | ~> 0.13.0 |
| aws | ~> 3.38 |

## Providers ##

| Name | Version |
|------|---------|
| aws | ~> 3.38 |

## Modules ##

| Name | Source | Version |
|------|--------|---------|
| ipsec\_tunnel | ../.. | n/a |

## Resources ##

| Name | Type |
|------|------|
| [aws_default_route_table.the_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_route_table) | resource |
| [aws_internet_gateway.the_igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_route.route_external_traffic_through_internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_subnet.the_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.the_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_availability\_zone | The AWS availability zone where the Virtual Private Gateway is to be deployed (e.g. a, b, c, etc.). | `string` | n/a | yes |
| aws\_region | The AWS region where the Virtual Private Gateway is to be deployed (e.g. us-east-1). | `string` | n/a | yes |
| remote\_cidr\_blocks | A list of CIDR blocks associated with the remote (non-AWS) end of the tunnel (e.g. [192.168.11.0/24, 10.10.11.0/24]). | `list(string)` | n/a | yes |
| remote\_ip | The public IP of the remote (non-AWS) end of the tunnel (e.g. 1.2.3.4). | `string` | n/a | yes |
| route\_table\_ids | A list of ID corresponding to route tables that should route traffic through the VPN/IPSec gateway (e.g. [rtb-0123456789abcdef0, rtb-0123456789abcdef1]). | `list(string)` | n/a | yes |
| tags | Tags to apply to all AWS resources created. | `map(string)` | `{}` | no |
| vpc\_id | The ID of the AWS VPC where the Virtual private Gateway is to be deployed (e.g. vpc-0123456789abcdef0). | `string` | n/a | yes |

## Outputs ##

| Name | Description |
|------|-------------|
| remote\_gateway\_configuration | The configuration information for the VPN connection's remote (non-AWS) gateway, in XML format. |
