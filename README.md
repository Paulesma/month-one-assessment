# TechCorp Month 1 Assessment - Terraform AWS Infrastructure

## Project Overview
This Terraform configuration provisions a secure, highly available web application infrastructure on AWS.

## Prerequisites
- AWS CLI configured
- Terraform installed in WSL
- SSH Key Pair uploaded to AWS
- Your current public IP address

## Deployment Steps

1. Copy variables:
   bash
   cp terraform.tfvars.example terraform.tfvars
   

2. Edit `terraform.tfvars` with your `key_pair_name` and `my_ip`

3. Run:
   bash
   terraform init
   terraform plan
   terraform apply

4. Post-Deployment Verification:
   Web Access: Use the alb_dns_name output to access the application via a browser.
   SSH Access: Use the Bastion host's public IP to jump into the private Web and DB servers.
   Database: Verify Postgres connectivity on the DB server using sudo -u postgres psql.

## Cleanup
bash
terraform destroy


## Evidence
Screenshots are in the `evidence/` folder.

Tested on WSL + VS Code.
