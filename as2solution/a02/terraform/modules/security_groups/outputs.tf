output "sg" {
  value = aws_security_group.self
  description = "the security group object"
}

output "id" {
  value = aws_security_group.self.id
  description = "the id of the security group"
}

