# Create an IPSec tunnel into an AWS VPC #

## Usage ##

To run this example you need to execute the `terraform init` command
followed by the `terraform apply` command.

Note that this example may create resources which cost money. Run
`terraform destroy` when you no longer need these resources.

## Outputs ##

| Name | Description |
|------|-------------|
| remote_gateway_configuration | The configuration information for the VPN connection's remote (non-AWS) gateway, in XML format. |
