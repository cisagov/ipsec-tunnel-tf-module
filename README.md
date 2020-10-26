# ipsec-tunnel-tf-module #

[![GitHub Build Status](https://github.com/cisagov/ipsec-tunnel-tf-module/workflows/build/badge.svg)](https://github.com/cisagov/ipsec-tunnel-tf-module/actions)

A Terraform module for deploying a an IPSec tunnel VPC.

## Usage ##

```hcl
module "ipsec_tunnel" {
  source = "github.com/cisagov/ipsec-tunnel-tf-module"

  aws_region            = "us-west-1"
  aws_availability_zone = "b"
  remote_cidr_blocks    = ["10.10.11.0/24"]
  remote_ip             = "1.2.3.4"
  route_table_ids       = ["rtb-0123456789abcdef0", "rtb-0123456789abcdef1"]
  vpc_id                = "vpc-0123456789abcdef0"

  tags = {
    Key1 = "Value1"
    Key2 = "Value2"
  }
}
```

## Examples ##

* [Create an IPSec tunnel into a VPC](https://github.com/cisagov/ipsec-tunnel-tf-module/tree/develop/examples/basic_usage)

## Requirements ##

| Name | Version |
|------|---------|
| terraform | ~> 0.12.0 |
| aws | ~> 3.0 |

## Providers ##

| Name | Version |
|------|---------|
| aws | ~> 3.0 |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws_availability_zone | The AWS availability zone where the Virtual Private Gateway is to be deployed (e.g. a, b, c, etc.) | `string` | n/a | yes |
| aws_region | The AWS region where the Virtual Private Gateway is to be deployed (e.g. us-east-1) | `string` | n/a | yes |
| remote_bgp_asn | The BGP ASN of the remote (non-AWS) end of the tunnel (e.g. 11111).  This value is not used if static_routes_only is true. | `number` | `65000` | no |
| remote_cidr_blocks | A list of CIDR blocks associated with the remote (non-AWS) end of the tunnel (e.g. [192.168.11.0/24, 10.10.11.0/24]) | `list(string)` | n/a | yes |
| remote_ip | The public IP of the remote (non-AWS) end of the tunnel (e.g. 1.2.3.4) | `string` | n/a | yes |
| route_table_ids | A list of ID corresponding to route tables that should route traffic through the VPN/IPSec gateway (e.g. [rtb-0123456789abcdef0, rtb-0123456789abcdef1]) | `list(string)` | n/a | yes |
| static_routes_only | A boolean value indicating whether the VPN connection uses static routes exclusively.  Static routes must be used for devices that don't support BGP. | `bool` | `true` | no |
| tags | Tags to apply to all AWS resources created | `map(string)` | `{}` | no |
| vpc_id | The ID of the AWS VPC where the Virtual private Gateway is to be deployed (e.g. vpc-0123456789abcdef0) | `string` | n/a | yes |

## Outputs ##

| Name | Description |
|------|-------------|
| remote_gateway_configuration | The configuration information for the VPN connection's remote (non-AWS) gateway, in XML format. |

## Notes ##

Running `pre-commit` requires running `terraform init` in every directory that
contains Terraform code. In this repository, these are the main directory and
every directory under `examples/`.

## Contributing ##

We welcome contributions!  Please see [`CONTRIBUTING.md`](CONTRIBUTING.md) for
details.

## License ##

This project is in the worldwide [public domain](LICENSE).

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.
