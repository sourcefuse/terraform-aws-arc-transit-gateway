################################################################################
## defaults
################################################################################
terraform {
  required_version = "~> 1.3, < 2.0.0"

  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = ">= 4.0, < 6.0"
      configuration_aliases = [aws.target]
    }
  }
}

provider "aws" {
  region = var.region
}


provider "aws" {
  alias  = "target"
  region = var.region
  assume_role {
    role_arn = "arn:aws:iam::123456789011:role/arc-destination-role"
  }
}

module "transit_gateway" {
  source = "../."

  create_transit_gateway                             = true
  create_transit_gateway_attacment_in_source_account = true
  transit_gateway_name                               = "${var.project_name}-Transit-GW"

  target_account_id      = ["123456789011"]
  source_vpc_id          = "vpc-041c8e8edab39fe4d"
  source_subnet_ids      = ["subnet-0e4915858deca8b7c", "subnet-0ad42d974829c18ca"]
  source_route_table_ids = ["rtb-09df595faf61cf122", "rtb-0cded0fad17ab4558"]
  providers = {
    aws        = aws
    aws.target = aws.target
  }

  target_vpc_id          = "vpc-0757e1c617bfc7cd1"
  target_subnet_ids      = ["subnet-0da77a6acf494b1f8", "subnet-098ef9f4a86deffc7"]
  target_route_table_ids = ["rtb-0a3f3556800060e9a", "rtb-0e3ab418edff8fe8c"]

}

provider "aws" {
  alias  = "target2"
  region = var.region
  assume_role {
    role_arn = "arn:aws:iam::098765432111:role/arc-destination-role-2"
  }
}

module "transit_gateway_target2" {
  source = "../."

  create_transit_gateway                             = false # Set this to 'false' as the Transit Gateway is created in the previous module.
  create_transit_gateway_attacment_in_source_account = false # Set this to 'false' as the Transit Gateway attachment source is created in the previous module.
  existing_transit_gateway_id                        = module.transit_gateway.transit_gateway_id

  source_route_table_ids = ["rtb-09df595faf61cf122", "rtb-0cded0fad17ab4558"]

  target_account_id = ["098765432111"]

  providers = {
    aws        = aws
    aws.target = aws.target2
  }

  target_vpc_id          = "vpc-0d56ce6a38df0434e"
  target_subnet_ids      = ["subnet-033eebbeceed00181", "subnet-034a98a9e9d325bd6"]
  target_route_table_ids = ["rtb-0ca108fb6702dbb22", "rtb-0d50d045823996e9e"]

  depends_on = [module.transit_gateway]
}
