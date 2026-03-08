#Server info.
data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}


#EC2 server info.
resource "aws_instance" "worker_node" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.practice_sg.id]

  tags = {
    Name = "${var.project_name}-Worker"
  }
}

#Generate server groups in ansible .ini.
resource "local_file" "ansible_inventory" {
  content  = "[web_servers]\n${aws_instance.worker_node.public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=../keys/practice.pem"
  filename = "../../ansible/inventory.ini"
}