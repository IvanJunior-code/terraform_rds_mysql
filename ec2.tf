###################### Key Pair ######################
resource "aws_key_pair" "ssh_key_terraform" {
  key_name   = var.key_name
  public_key = var.access_key

  tags = {
    Name      = "Key Pair"
    ManagedBy = var.tags_ManagedBy
  }
}
###################### ### #### ######################


###################### EC2 ######################
resource "aws_instance" "ec2_terraform" {
  ami                    = "ami-01079c0484361f159" # Ubuntu-2023-10-31T09-14
  instance_type          = "t3.small"
  #subnet_id              = aws_subnet.subnet_terraform.id
  #vpc_security_group_ids = [aws_security_group.sg_terraform.id]

  tags = {
    Name      = "EC2"
    ManagedBy = var.tags_ManagedBy
  }

  key_name = aws_key_pair.ssh_key_terraform.key_name
}
###################### ### ######################