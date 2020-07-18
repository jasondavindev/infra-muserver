variable "vpc_id" {
  type = string
}

variable "my_pc_ip" {
  type = string
}

variable "storage_size" {
  type = number
}

variable "engine" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "instance_class" {
  type = string
}

variable "name" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}

variable "port" {
  type = number
}

variable "subnets" {
  type = list(string)
}

variable "region" {
  type = string
}
