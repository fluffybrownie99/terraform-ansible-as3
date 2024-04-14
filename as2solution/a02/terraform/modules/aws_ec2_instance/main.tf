resource "aws_instance" "ec2_instance" {
  ami             = var.ami_id
  instance_type   = var.type
  key_name        = var.ssh_key_name
  subnet_id       = var.subnet_id
  security_groups = [var.security_group_id]
  tags = {
    Name    = var.name
    Project = var.project_name
    Server_Role = var.role
  }
}
