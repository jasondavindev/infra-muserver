resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("${path.module}/pub.ssh")
}

resource "aws_instance" "instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.instance-sg.id]
  tags                   = var.default_tags
  subnet_id              = var.subnet_id
  key_name               = aws_key_pair.deployer.id
}

resource "aws_security_group" "instance-sg" {
  name        = "ec2-sg"
  description = "EC2 Security managed by Terraform"
  tags        = var.default_tags
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_pc_ip]
  }

  ingress {
    description = "RDP from my IP"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = [var.my_pc_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
