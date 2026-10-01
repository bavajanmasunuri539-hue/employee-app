variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "employee-cluster"
}

variable "db_name" {
  description = "PostgreSQL database name"
  type        = string
  default     = "employee_db"
}

variable "db_username" {
  description = "PostgreSQL username"
  type        = string
  default     = "employeeadmin"
}

variable "db_password" {
  description = "PostgreSQL password"
  type        = string
  sensitive   = true
}
