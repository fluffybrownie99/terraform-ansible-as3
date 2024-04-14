variable "project_name" {
  description = "Project name"
  type = string
}

variable "type" {
  description = "Instance type"
  default     = "t2.micro"
  type = string
}

variable "aws_region" {
  description = "AWS region"
  type = string
}

variable "ami_id" {
  description = "AMI ID"
  type = string
}

variable "subnet_id" {
  description = "The subnet to launch the instance on"
  type = string
}

variable "security_group_id" {
  description = "The security group to launch the instance in"
  type = string
}

variable "ssh_key_name" {
  type = string
  description = "AWS SSH key name"
  default     = "acit_4640_202410"
}

variable "name" {
  description = "Name of the instance"
  type = string
}

variable "role" {
  description = "Role of the instance"
  type = string
}