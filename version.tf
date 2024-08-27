################################################################################
## defaults
################################################################################
terraform {
  required_version = "~> 1.3, < 2.0.0"

  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = "~> 5.0"
      configuration_aliases = [aws.target]
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}
