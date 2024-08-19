resource "aws_instance" "web" {
  ami           = "ami-0ad21ae1d0696ad58"
  instance_type = var.instance_type

  tags = {
    Name = "WebServer"
  }
}
