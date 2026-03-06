resource "aws_security_group" "practice_sg" {
  name = "practice_sg"
  description = "Firewall"
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.practice_sg.id
  from_port     = 22
  to_port      = 22
  ip_protocol = "tcp"

}