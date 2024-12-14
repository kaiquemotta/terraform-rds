variable "vpc_id" {
  description = "The VPC ID where the RDS instance will be deployed."
}

variable "db_username" {
  description = "The username for the RDS instance."
  default     = "root"

}

variable "db_password" {
  description = "The password for the RDS instance."
  default     = "s3rp3nt3123"

}

variable "subnet_ids" {
  description = "The IDs of the subnets to associate with the RDS instance."
}

variable "db_name" {
  description = "The name of the database to create."
  default     = "pdv"
}