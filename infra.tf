module "vpc" {
  source     = "./modules/vpc"
  cidr_block = "10.0.0.0/23"
}

module "subnet" {
  source = "./modules/subnets"
  vpc_id = module.vpc.id
  region = var.region
}

module "ec2" {
  source       = "./modules/ec2"
  # ami          = "ami-0556bdabf9e936767" // microsoft windows server
  ami          = "ami-0d00bb41f06bac65f"
  my_pc_ip     = var.my_pc_ip
  default_tags = var.default_tags
  vpc_id       = module.vpc.id
  subnet_id    = module.subnet.public
}

module "rds" {
  source         = "./modules/rds"
  storage_size   = 20
  engine         = "postgres"
  engine_version = "12"
  instance_class = "db.t2.micro"
  name           = "muserverdb"
  username       = var.rds_username
  password       = var.rds_password
  port           = 5432
  vpc_id         = module.vpc.id
  my_pc_ip       = var.my_pc_ip
  subnets        = [module.subnet.public, module.subnet.private]
  region         = var.region
}
