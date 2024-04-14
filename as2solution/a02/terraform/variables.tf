variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR written in CIDR notation, must have a 16 bit netmask"
  default     = "192.168.0.0/16"
  type        = string
}

variable "default_route" {
  description = "Default route"
  default     = "0.0.0.0/0"
  type        = string
}

variable "home_net" {
  description = "Home network, written in CIDR notation"
  type        = string
}

variable "bcit_net" {
  description = "BCIT network, written in CIDR notation"
  default     = "142.232.0.0/16"
  type        = string

}

variable "ssh_key_name" {
  description = "AWS SSH key name"
  default     = "acit_4640_202410"
  type        = string
}

variable "security_group" {
  description = "configuration for security group"
  type = object({
    name        = string
    description = string
    egress_rules = list(object(
      {
        description = string
        ip_protocol = string
        from_port   = number
        to_port     = number
        cidr_ipv4   = string
        rule_name   = string
      }
    ))
    ingress_rules = list(object(
      {
        description = string
        ip_protocol = string
        from_port   = number
        to_port     = number
        cidr_ipv4   = string
        rule_name   = string
      }
    ))
  })
}

variable "instance_count" {
  description = "Number of EC2 instances to launch"
  type        = number
  default     = 2
}

variable "instance_types" {
  description = "A list of type of EC2 instance types ordered by preference"
  type        = list(string)
  default     = ["t2.micro", "t3.micro"]
}
