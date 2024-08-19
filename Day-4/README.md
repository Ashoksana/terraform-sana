## Day 4: Modules, Data Sources, and Service Principals

### Modules

#### What are Modules in Terraform?
- **Modules** are containers that group together multiple resources that are used together. They allow for the reusability of code, making it easier to manage and organize your infrastructure.

#### Module Structure:
- A typical module consists of the following files:
  - **`main.tf`**: Defines the core resources of the module.
  - **`variables.tf`**: Contains the input variables for the module.
  - **`outputs.tf`**: Defines the outputs that the module provides, which can be used by other modules or configurations.

#### Using a Module:
- **Example: AWS VPC Module**:
  - In this example, we use an existing VPC module from the Terraform Registry to create a Virtual Private Cloud (VPC) in AWS.
  ```hcl
  module "vpc" {
    source  = "terraform-aws-modules/vpc/aws"
    version = "3.0.0"

    name = "my-vpc"
    cidr = "10.0.0.0/16"
  }


Explanation:
source: The location of the module. It can be a local path, a Git repository, or a Terraform Registry module.
version: The version of the module to use. This is especially important when pulling modules from the Terraform Registry.
name and cidr: Inputs required by the module, specified in the variables.tf file of the module.
Creating Your Own Module:
To create your own module, organize your Terraform code into a separate directory and structure it with the files mentioned above. Other configurations can then call your module by referencing its path.
Data Sources
What are Data Sources in Terraform?
Data Sources allow Terraform to query information defined outside of Terraform or managed by another entity. This data can then be used in your Terraform configurations.
Example of Using a Data Source:
Example: AWS AMI Data Source:

In this example, we use the aws_ami data source to retrieve the ID of the latest Ubuntu AMI (Amazon Machine Image).
hcl
Copy code
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
}

## Explanation:

data "aws_ami" "ubuntu": Defines a data source for an AWS AMI.
most_recent = true: Ensures that the most recent AMI that matches the filter is used.
filter: Filters the AMIs by name.
owners: Specifies the AWS account that owns the AMI (in this case, the official Ubuntu account).
ami = data.aws_ami.ubuntu.id: Uses the ID of the AMI found by the data source in an aws_instance resource.

### Service Principals
What are Service Principals?
Service Principals are identities used by applications or services to access specific resources in cloud environments. They are commonly used in Azure to manage identity and access control.
Example: Azure Service Principal
Example: Assigning a Role to a Service Principal in Azure:

In this example, we use the azurerm_role_assignment resource to assign the "Contributor" role to a service principal for a specific resource group.
hcl
Copy code
provider "azurerm" {
  features {}
}

resource "azurerm_role_assignment" "example" {
  scope                = azurerm_resource_group.example.id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.example.object_id
}

## Explanation:

provider "azurerm": Configures the Azure Resource Manager provider.
scope: The scope of the role assignment, typically the ID of a resource group, subscription, or management group.
role_definition_name = "Contributor": Specifies the role to assign. The "Contributor" role allows full access to manage all resources but does not allow access to assign roles in Azure RBAC.
principal_id = azuread_service_principal.example.object_id: The ID of the service principal to which the role is assigned.
Using Service Principals in Other Providers:

Service principals are also used in other cloud providers like AWS (as IAM roles) and GCP (as Service Accounts) to manage permissions for applications and services.