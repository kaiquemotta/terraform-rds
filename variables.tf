variable "aws_region" {
  description = "The AWS region to deploy resources."
  default     = "us-east-1"
}

variable "db_username" {
  description = "The username for the RDS instance."
  default     = "root"
}

variable "db_password" {
  description = "The password for the RDS instance."
  default     = "root"
}
