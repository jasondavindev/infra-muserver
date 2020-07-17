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

variable "vpc_id" {
  type = string
}
