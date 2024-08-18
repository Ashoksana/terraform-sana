resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.instance_type
  
  tags = {
    Name = "WebServer"
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket = "my-app-bucket"
  acl    = "private"
  
  tags = {
    Name = "MyAppBucket"
  }
}
