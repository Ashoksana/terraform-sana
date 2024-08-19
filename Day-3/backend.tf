terraform {
  backend "s3" {
    bucket = "terraform-backend-sana"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
  }
}
