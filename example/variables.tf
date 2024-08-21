################################################################################
## shared
################################################################################
variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region"
}

variable "project_name" {
  type        = string
  description = "Name of the project."
  default     = "arc"
}