output "endpoint_rds" {
  value = aws_db_instance.rds_mysql.endpoint
}

output "connect_ssh_to_ec2" {
  value = "ssh ubuntu@${aws_instance.ec2_terraform.public_ip} -i ~/.ssh/${aws_key_pair.ssh_key_terraform.key_name}"
}

output "connect_to_bd" {
  value = "mysql -h ${aws_db_instance.rds_mysql.address} -P ${aws_db_instance.rds_mysql.port} -u ${var.username} -p"
}
