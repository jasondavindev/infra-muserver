variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "default_tags" {
  type = map(string)
}

variable "my_pc_ip" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}
