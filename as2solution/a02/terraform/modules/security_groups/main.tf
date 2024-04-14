resource "aws_security_group" "self" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id
  tags = {
    Name    = var.name
    Project = var.project_name
  }
}

resource "aws_vpc_security_group_ingress_rule" "ingress" {
  # https://developer.hashicorp.com/terraform/language/meta-arguments/for_each
  # loop over map of rules (foreach only works with maps or sets of strings)
  for_each = {
    # https://developer.hashicorp.com/terraform/language/expressions/for 
    # loop over a list of rules to create a map of rules with the rule name as the key 
    for index, rule in var.ingress_rules : 
      # build literal map of rule objects
      rule.rule_name => rule # sets the key (rule.name) and value (rule) of the map (dictionary)
  }

  description       = each.value.description
  ip_protocol       = each.value.ip_protocol
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  cidr_ipv4         = each.value.cidr_ipv4
  security_group_id = aws_security_group.self.id
  tags = {
    Name    = each.value.rule_name
    Project = var.project_name
  }
}

resource "aws_vpc_security_group_egress_rule" "egress_rule" {
  for_each = {
    for index, rule in var.egress_rules :
    rule.rule_name => rule
  }

  description       = each.value.description
  security_group_id = aws_security_group.self.id
  ip_protocol       = each.value.ip_protocol
  cidr_ipv4         = each.value.cidr_ipv4
  from_port         = each.value.from_port
  to_port           = each.value.to_port

  tags = {
    Name    = each.value.rule_name
    Project = var.project_name
  }
}
