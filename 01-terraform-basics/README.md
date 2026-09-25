\# Terraform Basics — AWS S3



\## 📌 Project Overview



This is my first hands-on Terraform project.



The objective was to understand the basic Terraform workflow by creating an Amazon S3 bucket using Terraform and learning how Terraform authenticates with AWS.



\## 🎯 Objectives



\* Understand basic Terraform configuration

\* Configure the AWS provider

\* Create an AWS S3 bucket using Terraform

\* Understand `terraform init`

\* Understand `terraform fmt`

\* Understand `terraform validate`

\* Understand `terraform plan`

\* Understand `terraform apply`

\* Understand Terraform state

\* Verify that Terraform is tracking the created resource

\* Understand how Terraform obtains AWS authentication credentials



\---



\## 🏗️ Project Structure



```text

01-terraform-basics/

│

├── main.tf

├── README.md

├── .gitignore

└── .terraform.lock.hcl

```



\### Important files



| File                  | Purpose                                                         |

| --------------------- | --------------------------------------------------------------- |

| `main.tf`             | Terraform configuration                                         |

| `.terraform.lock.hcl` | Locks provider version and checksums                            |

| `.gitignore`          | Prevents state and Terraform working files from being committed |

| `README.md`           | Project documentation                                           |



\---



\# 🧩 Terraform Configuration



The project uses the AWS provider and creates an S3 bucket.



```hcl

terraform {

&#x20; required\_version = ">= 1.14.0, < 2.0.0"



&#x20; required\_providers {

&#x20;   aws = {

&#x20;     source  = "hashicorp/aws"

&#x20;     version = "\~> 6.0"

&#x20;   }

&#x20; }

}



provider "aws" {

&#x20; region = "ap-south-1"

}



resource "aws\_s3\_bucket" "demo" {

&#x20; bucket = "navyatesterbucket01-2026"

}

```



> The bucket name must be globally unique and follow Amazon S3 naming rules.



\---



\# 🔄 Terraform Commands Practiced



\## 1. Check Terraform Version



```bash

terraform version

```



Used to check the installed Terraform CLI version.



\---



\## 2. Initialize Terraform



```bash

terraform init

```



\### What it does



\* Initializes the Terraform working directory

\* Downloads the required provider

\* Prepares Terraform to work with AWS

\* Creates/updates `.terraform.lock.hcl`



\---



\## 3. Format Terraform Code



```bash

terraform fmt

```



Formats Terraform configuration files using Terraform's standard formatting conventions.



\---



\## 4. Validate Configuration



```bash

terraform validate

```



Checks whether the Terraform configuration is syntactically valid and internally consistent.



\---



\## 5. Create an Execution Plan



```bash

terraform plan

```



Shows what Terraform intends to create, modify, or destroy without actually making the changes.



Example:



```text

Plan: 1 to add, 0 to change, 0 to destroy.

```



\---



\## 6. Apply the Configuration



```bash

terraform apply

```



Executes the Terraform plan and creates the infrastructure in AWS.



Result:



```text

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

```



\---



\# 📦 Terraform State



After applying the configuration, Terraform tracks the created S3 bucket in its state.



\### List resources tracked by Terraform



```bash

terraform state list

```



Output:



```text

aws\_s3\_bucket.demo

```



This confirms that Terraform is tracking the S3 bucket.



\---



\## 🔍 Inspect Resource State



```bash

terraform state show aws\_s3\_bucket.demo

```



This displays detailed information stored in Terraform state for the S3 bucket, including:



\* Bucket name

\* ARN

\* Region

\* Bucket ID

\* Encryption information

\* Versioning information

\* Other resource attributes



\---



\## 📄 Pull Terraform State



```bash

terraform state pull

```



This retrieves the current Terraform state and displays it in JSON format.



The state contains information Terraform uses to understand and manage the infrastructure it controls.



\---



\# 🔐 AWS Authentication — First Challenge



One of the first things I wanted to understand was:



> How did Terraform create an AWS resource when I did not provide AWS credentials inside `main.tf`?



My Terraform provider configuration only specified the AWS region:



```hcl

provider "aws" {

&#x20; region = "ap-south-1"

}

```



No AWS access key or secret key was written in the Terraform configuration.



Terraform's AWS provider can use credentials available through the standard AWS credential chain. In my local environment, AWS CLI credentials were already configured.



I verified the identity being used by AWS CLI with:



```bash

aws sts get-caller-identity

```



This confirmed that the AWS CLI was authenticated to my AWS account using the configured IAM identity.



\### Key learning



Terraform did not need credentials hardcoded in `main.tf`.



Instead:



```text

Local AWS Credentials

&#x20;       ↓

AWS CLI / Credential Chain

&#x20;       ↓

Terraform AWS Provider

&#x20;       ↓

AWS API

&#x20;       ↓

S3

```



This is a better security practice than placing credentials directly inside Terraform configuration files.



> \*\*Security note:\*\* AWS access keys, secret keys, session tokens, passwords, and other sensitive credentials should never be committed to GitHub.



\---



\# 🧠 What I Learned



\### Terraform configuration



`main.tf` describes the infrastructure I want Terraform to manage.



\### Provider



The AWS provider allows Terraform to communicate with AWS APIs.



\### Resource



```hcl

resource "aws\_s3\_bucket" "demo"

```



Defines an AWS S3 bucket that Terraform manages.



\### State



Terraform state records information about resources managed by Terraform.



\### Authentication



Terraform can use credentials already available in the environment instead of storing credentials inside Terraform code.



\### Provider Lock File



`.terraform.lock.hcl` records the selected provider version and checksums.



\---



\# 🔄 Complete Workflow



```text

Write Terraform Configuration

&#x20;           ↓

&#x20;     terraform init

&#x20;           ↓

&#x20;     terraform fmt

&#x20;           ↓

&#x20;   terraform validate

&#x20;           ↓

&#x20;      terraform plan

&#x20;           ↓

&#x20;     Review Changes

&#x20;           ↓

&#x20;     terraform apply

&#x20;           ↓

&#x20;      AWS Resource

&#x20;        Created

&#x20;           ↓

&#x20;    Terraform State

&#x20;        Updated

&#x20;           ↓

&#x20;terraform state list/show/pull

```



\---



\# 🛡️ Security Practices Followed



\* No AWS credentials stored in `main.tf`

\* No AWS credentials committed to GitHub

\* Terraform state excluded using `.gitignore`

\* `.terraform/` excluded from Git

\* `.terraform.lock.hcl` committed to maintain provider consistency



\---



\# 🚀 Future Terraform Projects



This repository will progressively cover:



1\. Terraform Basics

2\. Remote State with S3

3\. Variables and tfvars

4\. Outputs and Locals

5\. Data Sources

6\. Terraform Functions

7\. AWS Networking

8\. EC2

9\. Terraform Modules

10\. Terraform Drift

11\. Workspaces

12\. Terraform Security

13\. Terraform CI/CD

14\. AWS EKS with Terraform



