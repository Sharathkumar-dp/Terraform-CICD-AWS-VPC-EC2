AWS Infrastructure Deployment Using Terraform and GitHub Actions
📌 Project Overview

This project automates the deployment of AWS infrastructure using Terraform and GitHub Actions CI/CD pipeline.

The infrastructure is provisioned using reusable Terraform internal modules, making the code modular, scalable, and easy to maintain.

AWS authentication is configured using an IAM user Access Key and Secret Access Key, securely stored as GitHub Actions Secrets.

🏗️ Architecture

The GitHub Actions pipeline automates the deployment of the following AWS resources:

AWS VPC
Public and/or Private Subnets
Internet Gateway
Route Tables and Route Table Associations
Security Groups
EC2 Instance
🛠️ Technologies Used
Technology	Purpose
AWS	Cloud Infrastructure
Terraform	Infrastructure as Code (IaC)
GitHub	Source Code Management
GitHub Actions	CI/CD Automation
AWS IAM	Authentication and Access Management
Terraform Modules	Reusable Infrastructure Components
📂 Project Structure
text
.
├── .github/
│   └── workflows/
│       └── terraform.yml
│
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   └── ec2/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── terraform.tfvars
├── versions.tf
└── README.md


Note: Update the directory structure according to your actual repository.

⚙️ Prerequisites

Before running this project, ensure you have:

An AWS account.
An IAM user with the required AWS permissions.
AWS Access Key ID and Secret Access Key.
A GitHub account.
Terraform installed (for local execution).
Git installed.
🔐 AWS Authentication Configuration

AWS authentication is configured using IAM user credentials stored securely in GitHub repository secrets.

Navigate to:

GitHub Repository → Settings → Secrets and variables → Actions → New repository secret

Create the following secrets:

Secret Name	Description
AWS_ACCESS_KEY_ID	AWS IAM User Access Key
AWS_SECRET_ACCESS_KEY	AWS IAM User Secret Access Key
AWS_REGION	AWS deployment region

The GitHub Actions workflow uses these secrets to authenticate with AWS.

Important: Never hardcode AWS credentials in Terraform files or commit them to GitHub.

🚀 GitHub Actions CI/CD Pipeline

The GitHub Actions workflow automates Terraform infrastructure deployment.

Pipeline Execution Steps
Developer pushes Terraform code to the GitHub repository.
GitHub Actions workflow gets triggered.
GitHub runner checks out the repository.
Terraform is initialized using terraform init.
Terraform configuration is validated using terraform validate.
Terraform execution plan is generated using terraform plan.
Terraform applies the configuration using terraform apply.
AWS infrastructure is successfully provisioned.
Terraform Commands Used
bash
terraform init
terraform fmt -check
terraform validate
terraform plan
terraform apply -auto-approve

🔄 Deployment Process
Step 1: Clone the Repository
bash
git clone <YOUR_GITHUB_REPOSITORY_URL>
cd <YOUR_REPOSITORY_NAME>

Step 2: Configure GitHub Secrets

Add the AWS credentials and AWS region under GitHub Actions Secrets.

Step 3: Push Code to GitHub
bash
git add .
git commit -m "Initial Terraform infrastructure deployment"
git push origin main

Step 4: Execute GitHub Actions Pipeline
Navigate to the GitHub repository.
Select the Actions tab.
Open the Terraform deployment workflow.
Monitor the pipeline execution.
Verify that all Terraform stages complete successfully.
Step 5: Verify AWS Resources

Log in to the AWS Management Console and verify that the following resources have been created:

VPC and associated networking resources.
Security Groups.
EC2 instance.
📤 Terraform Outputs

Terraform outputs can be used to display important infrastructure information, such as:

VPC ID
Subnet IDs
EC2 Instance ID
EC2 Public IP Address
🧹 Infrastructure Cleanup

To destroy the infrastructure created by Terraform, execute:

bash
terraform destroy


For automated cleanup, configure a separate GitHub Actions workflow with appropriate approval and access controls.

Warning: Destroying infrastructure will delete the resources managed by the Terraform configuration.

🔒 Security Best Practices
Store AWS credentials only in GitHub Actions Secrets.
Never commit AWS Access