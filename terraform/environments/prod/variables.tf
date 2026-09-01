variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "name" {
  type    = string
  default = "production-platform"
}

variable "vpc_cidr" {
  type    = string
  default = "10.20.0.0/16"
}

variable "availability_zones" {
  type    = list(string)
  default = ["ap-south-1a", "ap-south-1b"]
}

variable "kubernetes_version" {
  type    = string
  default = "1.31"
}

variable "node_instance_type" {
  type    = string
  default = "t3.medium"
}

variable "desired_nodes" {
  type    = number
  default = 2
}

variable "min_nodes" {
  type    = number
  default = 2
}

variable "max_nodes" {
  type    = number
  default = 4
}

variable "db_name" {
  type    = string
  default = "platform"
}

variable "db_username" {
  type    = string
  default = "platformadmin"
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "db_instance_class" {
  type    = string
  default = "db.t3.micro"
}
