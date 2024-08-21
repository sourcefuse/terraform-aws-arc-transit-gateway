################################################################
## variables
################################################################

variable "region" {
  description = "The AWS region to deploy to"
  type        = string
  default     = "us-east-1"
}


variable "transit_gateway_name" {
  description = "Name of the Transit Gateway"
  type        = string
  default     = "Transit-GW"
}

variable "transit_gateway_asn" {
  description = "Amazon side ASN for the Transit Gateway"
  type        = number
  default     = 64512
}

##############################################################
###################### Target Account ########################
variable "vpc_id" {
  description = "The VPC ID for the Transit Gateway VPC attachment"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the Transit Gateway VPC attachment"
  type        = list(string)
}

variable "route_table_ids" {
  description = "Route table ID to add routes to"
  type        = list(any)
}

variable "source_cidr_block" {
  description = "Destination CIDR block for the route"
  type        = string
}

variable "target_account_id" {
  description = "The AWS Account ID where the Transit Gateway is shared"
  type        = list(any)
}

##############################################################
###################### Source Account ########################

variable "source_vpc_id" {
  description = "The VPC ID for the Transit Gateway VPC attachment"
  type        = string
  default     = null
}

variable "source_subnet_ids" {
  description = "List of subnet IDs for the Transit Gateway VPC attachment"
  type        = list(string)
  default     = []
}

variable "source_route_table_ids" {
  description = "Route table ID to add routes to"
  type        = list(any)
  default     = []
}

variable "destination_cidr_block" {
  description = "Destination CIDR block for the route"
  type        = string
}
#######################################################################

variable "create_transit_gateway" {
  type    = bool
  default = false
}

variable "existing_transit_gateway_arn" {
  type    = string
  default = null
}

variable "existing_transit_gateway_id" {
  type    = string
  default = null
}

variable "create_transit_gateway_attacment_source" {
  type    = bool
  default = false
}