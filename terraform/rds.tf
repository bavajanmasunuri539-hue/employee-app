resource "aws_db_subnet_group" "employee" {
  name = "employee-db-subnet-group"

  subnet_ids = [
    "subnet-0c664bc391d36f6ca",
    "subnet-0a6acd672c090563a"
  ]
}

resource "aws_db_instance" "postgres" {
  identifier = "employee-postgres"

  engine         = "postgres"
  engine_version = "17"

  instance_class        = "db.t3.micro"
  allocated_storage     = 20
  storage_type          = "gp3"
  storage_encrypted     = true
  publicly_accessible   = false
  skip_final_snapshot   = true

  db_name  = "employee_db"
  username = "employeeadmin"
  password = var.db_password

  db_subnet_group_name = aws_db_subnet_group.employee.name

  backup_retention_period = 0
}