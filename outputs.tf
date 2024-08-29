output "transit_gateway_arn" {
  description = "The ARN of the Transit Gateway"
  value       = length(aws_ec2_transit_gateway.this) > 0 ? aws_ec2_transit_gateway.this[0].arn : null
}

output "transit_gateway_id" {
  description = "The ID of the Transit Gateway"
  value       = length(aws_ec2_transit_gateway.this) > 0 ? aws_ec2_transit_gateway.this[0].id : null
}
