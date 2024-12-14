output "vpc_id" {
  description = "The ID of the VPC."
  value       = module.vpc.vpc_id
}

output "rds_endpoint" {
  description = "The endpoint of the RDS instance."
  value       = module.rds.endpoint
}
