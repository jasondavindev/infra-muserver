variable "my_pc_ip" {
  type = string
}

variable "default_tags" {
  type = map(string)
  default = {
    Project = "MuServer"
    Name    = "MuServer"
  }
}

variable "rds_username" {
  type = string
}

variable "rds_password" {
  type = string
}

variable "region" {
  type = string
  default = "sa-east-1"
}
