provider "aws" {
  region     = var.region
  #aws_access_key = var.aws_access_key
  #aws_secret_key = var.aws_secret_key
}

resource "aws_instance" "web" {
  ami           = var.ami_value
  instance_type = var.instance_type
  key_name = var.key_name

  tags = {
    Name = var.instance_name
  }
}
