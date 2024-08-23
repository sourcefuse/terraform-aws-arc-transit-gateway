# Data block to fetch VPC CIDR block
data "aws_vpc" "target_vpc" {
  provider = aws.target
  id       = var.target_vpc_id
}

data "aws_vpc" "source_vpc" {
  id = var.source_vpc_id
}

# Data block to fetch transit_gateway arn
data "aws_ec2_transit_gateway" "this" {
  count = var.create_transit_gateway ? 0 : 1
  id    = var.existing_transit_gateway_id
}