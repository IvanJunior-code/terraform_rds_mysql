###################### VPC ######################
resource "aws_vpc" "vpc_rds" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name      = "VPC"
    ManagedBy = var.tags_ManagedBy
  }
}
###################### ### ######################

###################### Subnet ######################
resource "aws_subnet" "subnet_rds" {
  vpc_id                  = aws_vpc.vpc_rds.id
  cidr_block              = var.subnet_cidr_block
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name      = "Subnet"
    ManagedBy = var.tags_ManagedBy
  }
}
###################### ###### ######################

###################### Security Group ######################
resource "aws_security_group" "sg_rds" {
  name        = var.sg_name
  description = "Allow SSH, HTTP, HTTPS inbound traffic and outbound traffic"
  vpc_id      = aws_vpc.vpc_rds.id

  tags = {
    Name      = "Security Group"
    ManagedBy = var.tags_ManagedBy
  }
}
###################### ######## ##### ######################

###################### Security Group Ingress Rule ######################
resource "aws_vpc_security_group_ingress_rule" "ingress_ssh_ipv4" {
  security_group_id = aws_security_group.sg_rds.id
  description       = "Allow SSH inbound traffic IPv4."
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22

  tags = {
    Name      = "Ingress Rule SSH IPv4"
    ManagedBy = var.tags_ManagedBy
  }
}
###################### ######## ##### ####### #### ######################

