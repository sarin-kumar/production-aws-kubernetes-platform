resource "aws_db_subnet_group" "this" {
  name       = "${var.name}-db-subnets"
  subnet_ids = var.private_subnet_ids
}

resource "aws_security_group" "rds" {
  name   = "${var.name}-rds"
  vpc_id = var.vpc_id

  # Tighten this rule to the EKS node/pod security group before production.
  ingress {
    description = "PostgreSQL starter rule"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.20.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "this" {
  identifier             = "${var.name}-postgres"
  engine                 = "postgres"
  engine_version         = "16"
  instance_class         = var.instance_class
  allocated_storage      = 20
  max_allocated_storage  = 100
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  port                   = 5432
  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  skip_final_snapshot    = true
  publicly_accessible    = false
}
