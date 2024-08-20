/*data "aws_instance" "mydata" {
    filter {
        name = "tag:Name"
        values = ["terraform-datasource"]
    }

    depends_on = [
        "aws_instance.web"
    ]
}

output "get_data_from_datasource" {
    value = data.aws_instance.mydata.public_ip
}
*/

# Define a data source to fetch the latest Amazon Linux 2 AMI ID
data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  # Optional filters to narrow down the search
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# Use the data source to define an EC2 instance
resource "aws_instance" "example" {
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = "t2.micro"
}
