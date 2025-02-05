provider "aws" {
  region = var.region
}

resource "aws_instance" "web" {
  ami           = var.ami_value
  instance_type = var.instance_type
  key_name = var.key_name

  tags = {
    Name = var.instance_name
  }
}