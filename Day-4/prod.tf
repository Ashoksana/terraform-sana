module "prod_ec2_instance" {
    source = "./module"
    ami_value = "ami-0ad21ae1d0696ad58"
    instance_type = "t2.micro"
    instance_name = "prod-instance"
    key_name = "dgds"
    region = "ap-south-1"  
}

output "prod-public-ip-address" {
    value = module.prod_ec2_instance.public_ip
}