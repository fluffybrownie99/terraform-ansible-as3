output "vpc" {
  description = "VPC information including id, name, and CIDR"
  value = {
    "id" = aws_vpc.main.id
    "name" = aws_vpc.main.tags.Name
    "cidr" = aws_vpc.main.cidr_block
  }
}

output "subnets" {
  description = "A name indexed map of subnet information including id, CIDR, and availability zone"
  value = { 
    for subnet in aws_subnet.main: 
      subnet.tags.Name => {
        "id" = subnet.id
        "cidr" = subnet.cidr_block
        "az" = subnet.availability_zone
      }
   }
}

output "gateway" {
  description = "Gateway information including id and name"
  value = {
    "id" = aws_internet_gateway.main.id
    "name" = aws_internet_gateway.main.tags.Name
  }
}

output "route_table" {
  description = "Route table information including id and name"
  value = {
    "id" = aws_route_table.main.id
    "name" = aws_route_table.main.tags.Name
  }
}

output "security_group" {
  description = "Security group information including id and name"
  value = {
    "id" = aws_security_group.main.id
    "name" = aws_security_group.main.name
  }
    
}

output "ec2_instances" {
  description = "Name indexed Map of EC2 instance information that includes id, public IP, private IP, DNS name, and availability zone"
  value = {
    for instance in module.ec2_per_subnet: 
        instance.ec2_instance.tags.Name => {
          "id" = instance.ec2_instance.id
          "ip" = instance.ec2_instance.public_ip
          "priv_ip" = instance.ec2_instance.private_ip
          "dns_name" = instance.ec2_instance.public_dns
          "az" = instance.ec2_instance.availability_zone
      }
  }
}

output "ssh_pub_key_file" {
  description = "Absolute path to the public key file"
  value = abspath(module.ssh_key.pub_key_file)
}

output "ssh_priv_key_file" {
  description = "Absolute path to the private key file"
  value = abspath(module.ssh_key.priv_key_file)
}