# Azure Firewall Automation with Terraform and GitHub Actions

## Introduction

This project automates the deployment of Azure Firewall rules across multiple environments (DEV, TEST, PROD) using Terraform and GitHub Actions. It demonstrates how to manage infrastructure as code and implement CI/CD best practices for Azure resources.

## Prerequisites

- An Azure account with permissions to create resources.
- [Terraform](https://www.terraform.io/downloads.html) installed locally.
- [Git](https://git-scm.com/downloads) installed locally.

## Setup and Configuration

### Azure Resources

1. Create three resource groups in Azure for DEV, TEST, and PROD environments.
2. In each resource group, create an Azure Storage Account and a blob container named `terraform-state` for Terraform's remote state management.

### Terraform Configuration

1. Clone this repository to your local machine.
2. Navigate to the Terraform files and review the configurations. Update the `.tfvars` files for each environment with the appropriate values.

### GitHub Actions Workflow

1. The repository contains GitHub Actions workflows set up for each environment (DEV, TEST, PROD).
2. Review the workflow files in `.github/workflows` and adjust them as needed for your environment.

## Usage

To run Terraform commands locally:

1. Initialize Terraform:
