# variables.tf

# Variable for AWS Access Key
/*
variable "aws_access_key" {
  description = "The AWS access key"
  type        = string
  sensitive   = true
}
*/

# Variable for AWS Secret Key
/*
variable "aws_secret_key" {
  description = "The AWS secret key"
  type        = string
  sensitive   = true
}
*/

# Variable for the type of instance to launch
variable "instance_type" {
  description = "Type of instance to launch"
  type        = string
}

# Variable for AWS region
variable "region" {
  description = "The AWS region"
  type        = string
}

variable "instance_name" {
    description = "provide aws instance tag name"
    type = string
}

variable "ami_value" {
    description = "provide the aws ami id"
    type = string
}

variable "key_name" {
    description = "add key pair "
    type = string
}