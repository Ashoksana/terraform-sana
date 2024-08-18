Terraform Day 1 - Introduction and Basics
Overview
Welcome to Day 1 of Terraform! Today, we’ll cover the basics of Terraform, including its purpose, how it works, and the fundamental concepts you need to understand to get started with infrastructure as code (IaC).

What is Terraform?
Terraform is an open-source Infrastructure as Code (IaC) tool developed by HashiCorp. It allows you to define, provision, and manage infrastructure using a high-level configuration language called HashiCorp Configuration Language (HCL) or JSON.

Key Benefits of Terraform:
Declarative Syntax: Describe the desired state of your infrastructure, and Terraform will handle the creation, modification, and deletion of resources to achieve that state.
Provider Agnostic: Terraform supports multiple cloud providers, such as AWS, Azure, Google Cloud, and more, making it flexible and versatile.
State Management: Terraform maintains a state file to track the resources it manages, enabling it to detect changes and apply updates incrementally.
Plan and Apply: Terraform allows you to preview changes (with terraform plan) before applying them (with terraform apply), reducing the risk of unexpected changes.
Setting Up Terraform
Prerequisites
CLI: Install the Terraform CLI on your local machine.
Cloud Account: Set up an account with your preferred cloud provider (e.g., AWS, Azure, GCP).
Editor: Use an editor like Visual Studio Code with Terraform extensions for syntax highlighting and autocompletion.
Installation
Download Terraform: Visit the Terraform website and download the appropriate binary for your operating system.
Install Terraform: Follow the instructions to install Terraform on your machine. Verify the installation by running:
bash
Copy code
terraform --version
Terraform Basics
Terraform Workflow
Write Configuration: Define your infrastructure resources in .tf files using HCL.
Initialize: Prepare your working directory for use with Terraform by running terraform init.
Plan: Generate an execution plan by running terraform plan to preview the changes that will be made.
Apply: Apply the changes required to reach the desired state of the configuration by running terraform apply.
Destroy: If needed, delete all resources managed by the Terraform configuration by running terraform destroy.
Example: Simple EC2 Instance
hcl
Copy code
# main.tf
provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "TerraformExample"
  }
}
Commands Overview
terraform init: Initializes the Terraform working directory.
terraform plan: Creates an execution plan, previewing the changes that Terraform will make.
terraform apply: Applies the changes required to reach the desired state.
terraform destroy: Destroys the Terraform-managed infrastructure.
Conclusion
Day 1 covers the essentials to get you started with Terraform. As you progress, you’ll learn more about modules, state management, remote backends, and best practices for building scalable, maintainable infrastructure.
