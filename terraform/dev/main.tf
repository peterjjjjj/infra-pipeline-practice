data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-22.04-amd64-server-*"]
  }
  owners = ["099720109477"]
}


resource "aws_instance" "worker_node" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name = var.key_name

  tags = {
    Name = "${var.project_name}-Worker"
  }
}