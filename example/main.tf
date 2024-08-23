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
    role_arn = "arn:aws:iam::654654163064:role/arc-destination-role"
  }
}

module "transit_gateway" {
  source = "../."

  create_transit_gateway                  = true
  create_transit_gateway_attacment_source = true
  transit_gateway_name                    = "${var.project_name}-Transit-GW"

  target_account_id      = ["654654163064"]
  source_vpc_id          = "vpc-0828676a85368a010"
  source_subnet_ids      = ["subnet-0bd3777718064b8c1", "subnet-0ceedb9d964271d63"]
  source_route_table_ids = ["rtb-0f47f5b2f4294ed68", "rtb-0f91ca3850d4802eb"]
  providers = {
    aws        = aws
    aws.target = aws.target
  }

  target_vpc_id          = "vpc-021a5ebd8765454be"
  target_subnet_ids      = ["subnet-0967757bbf9e8b397", "subnet-0ba1d81aa9a056822"]
  target_route_table_ids = ["rtb-03694d12130a3ee16", "rtb-0a95cb0a679c62206"]

}

provider "aws" {
  alias  = "target2"
  region = var.region
  assume_role {
    role_arn = "arn:aws:iam::992382551538:role/arc-destination-role-2"
  }
}

module "transit_gateway_target2" {
  source = "../."

  create_transit_gateway                  = false # Set this to 'false' as the Transit Gateway is created in the previous module.
  create_transit_gateway_attacment_source = false # Set this to 'false' as the Transit Gateway attachment source is created in the previous module.
  existing_transit_gateway_id             = module.transit_gateway.transit_gateway_id

  source_route_table_ids = ["rtb-0f47f5b2f4294ed68", "rtb-0f91ca3850d4802eb"]

  target_account_id = ["992382551538"]

  providers = {
    aws        = aws
    aws.target = aws.target2
  }

  target_vpc_id          = "vpc-0d56ce6a38df0434e"
  target_subnet_ids      = ["subnet-033eebbeceed00181", "subnet-034a98a9e9d325bd6"]
  target_route_table_ids = ["rtb-0ca108fb6702dbb22", "rtb-0d50d045823996e9e"]

  depends_on = [module.transit_gateway]
}
