output "aws_vpc_id" {
  value = aws_vpc.vpc_terraform.id
}

output "subnet_id" {
  value = aws_subnet.subnet.id
}

output "security_group_id" {
  value = aws_security_group.security_group.id
}