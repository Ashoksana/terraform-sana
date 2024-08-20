# variables.tf
# Variable for the type of instance to launch
variable "instance_type" {
  description = "Type of instance to launch"
  type        = string
  default = "t2.micro"
}

# Variable for AWS region
variable "region" {
  description = "The AWS region"
  type        = string
  default     = "ap-south-1"  
}

variable "instance_name" {
    description = "provide aws instance tag name"
    type = string
    default = "terraform-datasource"
}

variable "ami_value" {
    description = "provide the aws ami id"
    type = string
    default = "ami-0ad21ae1d0696ad58"
}

variable "key_name" {
    description = "add key pair "
    type = string
    default = "dgds"
}