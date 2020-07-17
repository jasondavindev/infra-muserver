module "subnet" {
  source = "./modules/subnets"
  vpc_id = var.vpc_id
}

module "ec2" {
  source       = "./modules/ec2"
  ami          = "ami-0556bdabf9e936767" // microsoft windows server
  my_pc_ip     = var.my_pc_ip
  default_tags = var.default_tags
  vpc_id       = var.vpc_id
  subnet_id    = module.subnet.subnet-id
}
