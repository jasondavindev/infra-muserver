data "aws_vpc" "vpc" {
  id = var.vpc_id
}

resource "aws_db_subnet_group" "subnets" {
  name       = "rds-subnet-group"
  subnet_ids = var.subnets
}

resource "aws_db_instance" "rds" {
  storage_type           = "gp2"
  allocated_storage      = var.storage_size
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  name                   = var.name
  username               = var.username
  password               = var.password
  port                   = var.port
  deletion_protection    = false
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.rds-sg.id]
  db_subnet_group_name   = aws_db_subnet_group.subnets.name
  identifier             = var.name
  availability_zone      = "${var.region}a"
  publicly_accessible    = true # TODO: false

  tags = {
    Name = var.name
  }
}

resource "aws_security_group" "rds-sg" {
  name        = "rds-sg"
  vpc_id      = var.vpc_id
  description = "Security Group for the rds"

  ingress {
    from_port   = var.port
    to_port     = var.port
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.vpc.cidr_block, var.my_pc_ip]
  }

  egress {
    protocol  = "-1"
    from_port = 0
    to_port   = 0

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }

  tags = {
    Name = "muserver-rds-sg"
  }
}
