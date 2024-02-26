variable "key_name" {
  default = "us-east-1_work"
}

variable "access_key" {
}

variable "tags_ManagedBy" {
  default = "Terraform"
}

variable "username" {
}

variable "password" {
}

variable "db_name" {
  default = "mydb"
}

variable "vpc_cidr_block" {
  default = "172.16.0.0/16"
}

variable "subnet_cidr_block" {
  default = "172.16.10.0/24"
}

variable "availability_zone" {
  default = "us-east-1a"
}

variable "sg_name" {
  default = "sg_rds"
}