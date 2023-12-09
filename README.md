# Azure Firewall Automation with Terraform and GitHub Actions

## Introduction

This repository automates the deployment of Azure Firewall policies across multiple environments - Development (DEV), Testing (TEST), and Production (PROD) - using Terraform and GitHub Actions. It showcases the use of Infrastructure as Code (IaC) to manage Azure resources and the implementation of Continuous Integration and Continuous Deployment (CI/CD) best practices with branch-specific workflows.

## Prerequisites

- An active Azure account with necessary permissions.
- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- [Git](https://git-scm.com/downloads) for version control.

## Setup and Configuration

### Azure Resources Setup

1. **Virtual Network and Subnets**:
   - Create or use an existing Azure Virtual Network (VNet) and Subnets for DEV, TEST, and PROD environments.
   - Note the Subnet IDs as they will be used in Terraform configurations and GitHub Secrets.

2. **Resource Groups**:
   - Create separate resource groups in Azure for DEV, TEST, and PROD environments.

3. **Storage Accounts for Terraform State**:
   - Create an Azure Storage Account in each resource group.
   - Within each storage account, create a blob container named `terraform-state` for Terraform's remote state.

### Terraform Configuration

1. **Repository Cloning**:
   - Clone the repository: `git clone [repository-url]`.
2. **Configuration Review**:
   - Review the Terraform configuration files.
   - Update the `.tfvars` files for each environment with appropriate Azure settings.

### GitHub Actions Workflow Setup

1. **Branch-Specific Workflow Files**:
   - Each branch (`dev`, `test`, `prod`) contains a specific GitHub Actions workflow file.
2. **Workflow Customization**:
   - Tailor the workflow files in each branch to suit your specific Azure environment settings.

### Setting Up GitHub Secrets for CI/CD

Required secrets for Azure authentication and environment configuration:

1. **Azure Service Principal**:
   - Create a service principal for GitHub Actions authentication with Azure.
   - Command: `az ad sp create-for-rbac --name "GitHubActionSP" --role contributor --scopes /subscriptions/{subscription-id}`.
   - Record the `appId`, `password`, `tenant`, and `subscriptionId`.

2. **Add Secrets to GitHub Repository**:
   - Go to your GitHub repository → Settings → Secrets.
   - Add the following secrets:
     - `AZURE_CLIENT_ID`: The `appId` from the service principal.
     - `AZURE_CLIENT_SECRET`: The `password` from the service principal.
     - `AZURE_TENANT_ID`: The `tenant` from the service principal.
     - `AZURE_SUBSCRIPTION_ID`: Your Azure subscription ID.
     - `AZURE_SUBNET_ID_DEV`: Subnet ID for the DEV environment.
     - `AZURE_SUBNET_ID_TEST`: Subnet ID for the TEST environment.
     - `AZURE_SUBNET_ID_PROD`: Subnet ID for the PROD environment.

### Configuring GitHub Environments

1. **Create Environments**:
   - In your GitHub repository, go to Settings → Environments.
   - Create an environment named `production`.
   - Add required approvers for deployments to the production environment.

## Usage Instructions

### Running Terraform Locally

To deploy changes via Terraform directly:

1. **Initialize Terraform**:
   - `terraform init`
2. **Create Execution Plan**:
   - `terraform plan`
3. **Apply Configuration**:
   - `terraform apply`

### Deploying via GitHub Actions

1. **Push Changes to Branches**:
   - Commit and push your changes to the appropriate branch (`dev`, `test`, `prod`).
2. **Monitor Workflow Execution**:
   - Check the Actions tab in your GitHub repository to view workflow execution.
   - Approve deployments in the `production` environment as needed.
