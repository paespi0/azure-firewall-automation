# Azure Firewall Automation with Terraform and GitHub Actions

## Introduction

This repository is dedicated to automating the deployment of Azure Firewall rules across multiple environments - Development (DEV), Testing (TEST), and Production (PROD) - using Terraform and GitHub Actions. It showcases the use of infrastructure as code (IaC) to manage Azure resources and the implementation of Continuous Integration and Continuous Deployment (CI/CD) best practices.

## Prerequisites

- An active Azure account with permissions to create and manage resources.
- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- [Git](https://git-scm.com/downloads) for version control.

## Setup and Configuration

### Azure Resources Setup

1. **Resource Groups**: Create three resource groups in the Azure Portal for the DEV, TEST, and PROD environments.
2. **Storage Accounts for Terraform State**:
   - In each resource group, create an Azure Storage Account.
   - Create a blob container named `terraform-state` in each storage account for remote state management by Terraform.

### Terraform Configuration

1. **Repository Cloning**:
   - Clone this repository to your local system using `git clone [repository-url]`.
2. **Configuration Review**:
   - Navigate to the Terraform configuration files.
   - Update the `.tfvars` files for each environment with appropriate values for your Azure setup.

### GitHub Actions Workflow Setup

1. **Workflow Files**:
   - The repository includes pre-configured GitHub Actions workflows for each environment in the `.github/workflows` directory.
2. **Workflow Customization**:
   - Review and adjust the workflow files as necessary to suit your specific Azure environment settings.

### Setting Up GitHub Secrets for CI/CD

GitHub Actions workflows in this project require certain secrets to be set for Azure authentication and deployment:

1. **Create Azure Service Principal**:
   - Use the Azure CLI to create a service principal which GitHub Actions will use for authenticating with Azure.
   - Command: `az ad sp create-for-rbac --name "GitHubActionSP" --role contributor --scopes /subscriptions/{subscription-id}`.
   - Note the `appId`, `password`, `tenant`, and `subscriptionId`.

2. **Add Secrets to GitHub Repository**:
   - Navigate to your GitHub repository → Settings → Secrets.
   - Add the following secrets:
     - `AZURE_CLIENT_ID`: The `appId` from the Azure service principal.
     - `AZURE_CLIENT_SECRET`: The `password` from the Azure service principal.
     - `AZURE_TENANT_ID`: The `tenant` from the Azure service principal.
     - `AZURE_SUBSCRIPTION_ID`: Your Azure subscription ID.

## Usage Instructions

### Running Terraform Locally

Execute the following commands within your local repository to deploy changes via Terraform directly:

1. **Initialize Terraform**:
- terraform init
    
2. **Create Execution Plan**:
- terraform plan
    
3. **Apply Configuration**:
- terraform apply

### Deploying via GitHub Actions

1. **Push Changes**:
- Commit and push your Terraform configuration changes to the respective branch (`dev`, `test`, `prod`).
2. **Monitor Workflow Execution**:
- View the execution of workflows in the Actions tab of your GitHub repository.
