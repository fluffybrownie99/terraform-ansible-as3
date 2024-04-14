variable "name" {
  description = "the name of the security group"
  type        = string
}

variable "description" {
  description = "the description of the security group"
  type        = string
}

variable "project_name" {
  description = "the project that the sg belongs to, used to tag AWS resources"
  type        = string
}

variable "vpc_id" {
  description = "the id of the vpc"
  type        = string
}

variable "ingress_rules" {
  type = list(object(
    {
      description = string
      ip_protocol = string
      from_port   = number
      to_port     = number
      cidr_ipv4   = string
      rule_name   = string
    }
  ))
  description = "the ingress rules for the security group in the form of a list of ingress rule configuration objects"

  validation {
    condition = alltrue([
      #loop over all rules
      for rule in var.ingress_rules :
        #check if the from_port and to_port are null if the ip_protocol is -1
        alltrue([rule.from_port == null, rule.to_port == null])
        if rule.ip_protocol == "-1"
    ])
    error_message = "Ingress rules with ip_protocol = -1 must not have a from_port or to_port"
  }
}

variable "egress_rules" {
  type = list(object(
    {
      description = string
      ip_protocol = string
      from_port   = number
      to_port     = number
      cidr_ipv4   = string
      rule_name   = string
    }
  ))
  description = "the egress rules for the security group in the form of a list egress rule configuration objects"

  validation {
    condition = alltrue([
      #loop over all rules
      for rule in var.egress_rules : 
        #check if the from_port and to_port are null if the ip_protocol is -1
        alltrue([rule.from_port == null, rule.to_port == null]) 
        if rule.ip_protocol == "-1"
    ])
    error_message = "Egress rules with ip_protocol = -1 must not have a from_port or to_port"
  }
}

