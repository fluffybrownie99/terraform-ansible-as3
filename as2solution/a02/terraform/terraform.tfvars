aws_region = "us-west-2"
project_name = "a02"
vpc_cidr = "172.16.0.0/16"
home_net = "75.157.0.0/16"
bcit_net = "142.232.0.0/16"
instance_count = 2

security_group = {
  name = "sg_a02"
  description = "Allows ssh, web, and intra-vpc ingress access and all egress"
  ingress_rules = [
    {
      description = "ssh access from home"
      ip_protocol = "tcp"
      from_port = 22
      to_port = 22
      cidr_ipv4 = "75.157.0.0/16"
      rule_name = "ssh_access_home"
    },
    {
      description = "ssh access from bcit"
      ip_protocol = "tcp"
      from_port = 22
      to_port = 22
      cidr_ipv4 = "142.232.0.0/16"
      rule_name = "ssh_access_bcit"
    },
    {
      description = "web access from home"
      ip_protocol = "tcp"
      from_port = 80
      to_port = 80
      cidr_ipv4 = "75.157.0.0/16"
      rule_name = "web_access_home"
    },
    {
      description = "web access from bcit"
      ip_protocol = "tcp"
      from_port = 80
      to_port = 80
      cidr_ipv4 = "142.232.0.0/16"
      rule_name = "web_access_bcit"
    },
    {
      description = "internal access within the vpc"
      ip_protocol = "-1"
      from_port = null 
      to_port = null 
      cidr_ipv4 = "172.16.0.0/16"
      rule_name = "intra_vpc_access"
    }
  ]
  egress_rules = [ 
    {
      description = "allow all egress traffic"
      ip_protocol = "-1"
      from_port = null 
      to_port = null 
      cidr_ipv4 = "0.0.0.0/0"
      rule_name = "allow_all_egress"
    }
   ]
}
