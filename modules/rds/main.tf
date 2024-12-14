resource "aws_db_instance" "main" {
  identifier              = "pdv-db"
  allocated_storage       = 20
  engine                  = "mysql"
  engine_version          = "8.0.39"
  instance_class          = "db.t3.micro"
  username                = var.db_username
  password                = var.db_password
  parameter_group_name    = "default.mysql8.0"
  skip_final_snapshot     = true
  publicly_accessible     = true
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  db_subnet_group_name    = aws_db_subnet_group.main.name
  tags = {
    Name = "pdv-db"
  }


  provisioner "local-exec" {
    command = <<EOT
      echo "CREATE DATABASE IF NOT EXISTS ${var.db_name};" | mysql -h ${self.endpoint} -P 3306 -u ${var.db_username} -p ${var.db_password}
    EOT
  }
}

resource "aws_security_group" "rds_sg" {
  vpc_id = var.vpc_id
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "rds-sg"
  }
}

resource "aws_db_subnet_group" "main" {
  name       = "main-subnet-group"
  subnet_ids = var.subnet_ids
  tags = {
    Name = "main-subnet-group"
  }
}

output "rds_endpoint" {
  description = "The endpoint of the RDS instance."
  value       = aws_db_instance.main.endpoint
}
