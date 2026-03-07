resource "aws_security_group" "practice_sg" {
  name        = "practice_sg"
  description = "Firewall"
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  ip_protocol       = "tcp"
  security_group_id = aws_security_group.practice_sg.id
  from_port         = 22
  to_port           = 22
  #Allowing any access.
  cidr_ipv4   = "0.0.0.0/0"
  description = "Nginx web traffic"

}

resource "aws_vpc_security_group_ingress_rule" "allow_nginx" {
  ip_protocol       = "tcp"
  security_group_id = aws_security_group.practice_sg.id
  from_port         = 443
  to_port           = 443
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "allow_outbound" {
  ip_protocol       = "-1"
  security_group_id = aws_security_group.practice_sg.id
  cidr_ipv4         = "0.0.0.0/0"
}