variable "aws_region" {
  description = "AWS region"
  type = string
  default = "us-west-2"
}

variable "key_name" {
  description = "Name of the SSK Key pair accessing EC2"
  type = string
}

variable "instance_type" {
  description = "EC2 instance size"
  type = string
  default = "t2.micro"
}

variable "project_name" {
  description = "Name of the proj"
  type = string
  default = "Infra-Practice"
}