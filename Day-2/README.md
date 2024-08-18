# Terraform Day 2 - Configuration Files and Structure

## Overview
On Day 2, we'll dive deeper into the structure of a Terraform project by discussing the different configuration files you'll commonly use: `provider.tf`, `terraform.tf`, `resources.tf`, and `variables.tf`. Understanding these files will help you organize your Terraform code efficiently and manage your infrastructure with greater clarity.

## provider.tf
The `provider.tf` file is used to configure the cloud providers and other services that Terraform will interact with. Providers are responsible for creating and managing resources on those platforms.

### Example:
```hcl
provider "aws" {
  region     = "us-west-2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

## Key Points:
The provider block specifies the cloud provider (e.g., AWS, Azure, GCP).
Configuration parameters like region, access_key, and secret_key are set in this file.
Variables can be used to keep sensitive data out of the codebase.

## terraform.tf
The terraform.tf file is used to configure Terraform settings like the backend and required providers.

### Example:
```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  
  backend "s3" {
    bucket = "my-terraform-state-bucket"
    key    = "global/s3/terraform.tfstate"
    region = "us-west-2"
  }
}

## Keypoints:
The terraform block is used to configure required providers and backends.
The backend block (like s3 in the example) is used to store Terraform's state file remotely, ensuring consistency across teams.

## resources.tf
The resources.tf file is where you define the actual infrastructure resources that Terraform will manage.

### Example:
```hcl
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

## Key Points:
The resource block is used to define infrastructure components.
Each resource has a unique name and type (e.g., aws_instance, aws_s3_bucket).
Resources can be tagged for better management and organization.

## variables.tf
The variables.tf file is used to define input variables that make your Terraform configuration more flexible and reusable.
### Example:
```hcl
variable "aws_access_key" {
  description = "The AWS access key"
  type        = string
}

variable "aws_secret_key" {
  description = "The AWS secret key"
  type        = string
}

variable "instance_type" {
  description = "Type of instance to launch"
  type        = string
  default     = "t2.micro"
}

## Key Points:
The variable block is used to define input variables, which can be referenced in other configuration files.
Variables can have descriptions, types, and default values.
Variables increase the flexibility and reusability of your Terraform code.

## Putting It All Together
Here’s how these files work together:

provider.tf: Configures the provider, such as AWS.
terraform.tf: Configures Terraform settings like the backend and required providers.
resources.tf: Defines the actual resources to be managed by Terraform.
variables.tf: Defines variables that can be used throughout the other files.
By organizing your Terraform configuration into these files, you maintain clarity and separation of concerns, making your code easier to manage and scale.

## Conclusion
Day 2 introduces you to a structured way of organizing your Terraform configurations. This approach allows for better scalability, maintainability, and collaboration within teams as your infrastructure grows in complexity.

