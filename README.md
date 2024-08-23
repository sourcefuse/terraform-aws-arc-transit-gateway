# terraform-aws-transit-gateway-module

## Overview

SourceFuse AWS Reference Architecture (ARC) Terraform module for managing Transit Gateway Terraform module provides a robust solution for managing complex network architectures within AWS. This module simplifies the creation, configuration, and management of AWS Transit Gateway, VPC attachments, and routing between VPCs. It ensures efficient network integration and connectivity across multiple AWS accounts by leveraging AWS best practices and conditional resource creation, making it ideal for scalable and flexible network solutions.

## Usage

To see a full example, check out the [main.tf](./example/main.tf) file in the example folder.  


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3, < 2.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.67.0 |
| <a name="provider_aws.target"></a> [aws.target](#provider\_aws.target) | 4.67.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ec2_transit_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway) | resource |
| [aws_ec2_transit_gateway_vpc_attachment.source](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_vpc_attachment) | resource |
| [aws_ec2_transit_gateway_vpc_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_vpc_attachment) | resource |
| [aws_ec2_transit_gateway_vpc_attachment_accepter.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_vpc_attachment_accepter) | resource |
| [aws_ram_principal_association.target_account](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ram_principal_association) | resource |
| [aws_ram_resource_association.transit_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ram_resource_association) | resource |
| [aws_ram_resource_share.transit_gateway_share](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ram_resource_share) | resource |
| [aws_ram_resource_share_accepter.transit_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ram_resource_share_accepter) | resource |
| [aws_route.source](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_ec2_transit_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ec2_transit_gateway) | data source |
| [aws_vpc.source_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |
| [aws_vpc.target_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_external_principals"></a> [allow\_external\_principals](#input\_allow\_external\_principals) | Indicates whether external principals (accounts outside the organization) are allowed. | `bool` | `true` | no |
| <a name="input_auto_accept_shared_attachments"></a> [auto\_accept\_shared\_attachments](#input\_auto\_accept\_shared\_attachments) | Whether resource attachment requests are automatically accepted | `string` | `"disable"` | no |
| <a name="input_create_before_destroy"></a> [create\_before\_destroy](#input\_create\_before\_destroy) | Determines whether the resource should be created before being destroyed. | `bool` | `true` | no |
| <a name="input_create_transit_gateway"></a> [create\_transit\_gateway](#input\_create\_transit\_gateway) | n/a | `bool` | `true` | no |
| <a name="input_create_transit_gateway_attacment_source"></a> [create\_transit\_gateway\_attacment\_source](#input\_create\_transit\_gateway\_attacment\_source) | n/a | `bool` | `true` | no |
| <a name="input_default_route_table_association"></a> [default\_route\_table\_association](#input\_default\_route\_table\_association) | Whether resource attachments are associated with the default route table | `string` | `"enable"` | no |
| <a name="input_default_route_table_propagation"></a> [default\_route\_table\_propagation](#input\_default\_route\_table\_propagation) | Whether resource attachments automatically propagate routes to the default route table | `string` | `"enable"` | no |
| <a name="input_dns_support"></a> [dns\_support](#input\_dns\_support) | Enable or disable DNS support | `string` | `"enable"` | no |
| <a name="input_existing_transit_gateway_id"></a> [existing\_transit\_gateway\_id](#input\_existing\_transit\_gateway\_id) | n/a | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to deploy to | `string` | `"us-east-1"` | no |
| <a name="input_source_attachment_dns_support"></a> [source\_attachment\_dns\_support](#input\_source\_attachment\_dns\_support) | Enable or disable DNS support | `string` | `"enable"` | no |
| <a name="input_source_attachment_ipv6_support"></a> [source\_attachment\_ipv6\_support](#input\_source\_attachment\_ipv6\_support) | Enable or disable IPv6 support | `string` | `"disable"` | no |
| <a name="input_source_attachment_name"></a> [source\_attachment\_name](#input\_source\_attachment\_name) | A map of tags to assign to the source Transit Gateway VPC attachment. | `map(string)` | <pre>{<br>  "Name": "TransitGateway-VPC-Attachment-Source"<br>}</pre> | no |
| <a name="input_source_cidr_block"></a> [source\_cidr\_block](#input\_source\_cidr\_block) | Destination CIDR block for the route | `string` | `null` | no |
| <a name="input_source_route_table_ids"></a> [source\_route\_table\_ids](#input\_source\_route\_table\_ids) | Route table ID to add routes to | `list(any)` | `[]` | no |
| <a name="input_source_subnet_ids"></a> [source\_subnet\_ids](#input\_source\_subnet\_ids) | List of subnet IDs for the Transit Gateway VPC attachment | `list(string)` | `[]` | no |
| <a name="input_source_vpc_id"></a> [source\_vpc\_id](#input\_source\_vpc\_id) | The VPC ID for the Transit Gateway VPC attachment | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resource. | `map(string)` | `{}` | no |
| <a name="input_target_account_id"></a> [target\_account\_id](#input\_target\_account\_id) | The AWS Account ID where the Transit Gateway is shared | `list(any)` | n/a | yes |
| <a name="input_target_attachment_dns_support"></a> [target\_attachment\_dns\_support](#input\_target\_attachment\_dns\_support) | Enable or disable DNS support | `string` | `"enable"` | no |
| <a name="input_target_attachment_ipv6_support"></a> [target\_attachment\_ipv6\_support](#input\_target\_attachment\_ipv6\_support) | Enable or disable IPv6 support | `string` | `"disable"` | no |
| <a name="input_target_attachment_name"></a> [target\_attachment\_name](#input\_target\_attachment\_name) | A map of tags to assign to the Target Transit Gateway VPC attachment. | `map(string)` | <pre>{<br>  "Name": "TransitGateway-VPC-Attachment-Target"<br>}</pre> | no |
| <a name="input_target_cidr_block"></a> [target\_cidr\_block](#input\_target\_cidr\_block) | Destination CIDR block for the route | `string` | `null` | no |
| <a name="input_target_route_table_ids"></a> [target\_route\_table\_ids](#input\_target\_route\_table\_ids) | Route table ID to add routes to | `list(any)` | n/a | yes |
| <a name="input_target_subnet_ids"></a> [target\_subnet\_ids](#input\_target\_subnet\_ids) | List of subnet IDs for the Transit Gateway VPC attachment | `list(string)` | n/a | yes |
| <a name="input_target_vpc_id"></a> [target\_vpc\_id](#input\_target\_vpc\_id) | The VPC ID for the Transit Gateway VPC attachment | `string` | n/a | yes |
| <a name="input_transit_gateway_asn"></a> [transit\_gateway\_asn](#input\_transit\_gateway\_asn) | Amazon side ASN for the Transit Gateway | `number` | `64512` | no |
| <a name="input_transit_gateway_name"></a> [transit\_gateway\_name](#input\_transit\_gateway\_name) | Name of the Transit Gateway | `string` | `"Transit-GW"` | no |
| <a name="input_transit_gateway_share_name"></a> [transit\_gateway\_share\_name](#input\_transit\_gateway\_share\_name) | The name of the Transit Gateway resource share. | `string` | `"transit-gateway-share"` | no |
| <a name="input_vpn_ecmp_support"></a> [vpn\_ecmp\_support](#input\_vpn\_ecmp\_support) | Enable or disable Equal Cost Multipath support for VPN | `string` | `"enable"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_transit_gateway_arn"></a> [transit\_gateway\_arn](#output\_transit\_gateway\_arn) | n/a |
| <a name="output_transit_gateway_id"></a> [transit\_gateway\_id](#output\_transit\_gateway\_id) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Versioning  
This project uses a `.version` file at the root of the repo which the pipeline reads from and does a git tag.  

When you intend to commit to `main`, you will need to increment this version. Once the project is merged,
the pipeline will kick off and tag the latest git commit.  

## Development

### Prerequisites

- [terraform](https://learn.hashicorp.com/terraform/getting-started/install#installing-terraform)
- [terraform-docs](https://github.com/segmentio/terraform-docs)
- [pre-commit](https://pre-commit.com/#install)
- [golang](https://golang.org/doc/install#install)
- [golint](https://github.com/golang/lint#installation)

### Configurations

- Configure pre-commit hooks
  ```sh
  pre-commit install
  ```

### Versioning

while Contributing or doing git commit please specify the breaking change in your commit message whether its major,minor or patch

For Example

```sh
git commit -m "your commit message #major"
```
By specifying this , it will bump the version and if you don't specify this in your commit message then by default it will consider patch and will bump that accordingly

### Tests
- Tests are available in `test` directory
- Configure the dependencies
  ```sh
  cd test/
  go mod init github.com/sourcefuse/terraform-aws-refarch-<module_name>
  go get github.com/gruntwork-io/terratest/modules/terraform
  ```
- Now execute the test  
  ```sh
  go test -timeout  30m
  ```

## Authors

This project is authored by:
- SourceFuse ARC Team
