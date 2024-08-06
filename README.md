
# iac
 
This repository contains Terraform modules for managing AWS resources. The structure is organized to separate concerns and promote reusability.
 
## Overview
 
This repository leverages Terraform to provision and manage various AWS resources including S3 buckets, Glue Crawlers, Step Functions, Glue Jobs, IAM roles, and Lambda functions. Each resource is encapsulated in its own module to ensure modularity and ease of maintenance. This approach allows for reusable and scalable infrastructure code.
 
## Repository Structure
 
        infrastructure-as-a-code/
        │
        └── terraform/
            ├── modules/
            │   ├── glue_crawler/
            │   │   ├── main.tf
            │   │   ├── variables.tf
            │   │   └── outputs.tf
            │   ├── stepfunction/
            │   │   ├── main.tf
            │   │   ├── variables.tf
            │   │   └── outputs.tf
            │   ├── glue_jobs/
            │   │   ├── main.tf
            │   │   ├── variables.tf
            │   │   └── outputs.tf
            │   └── lambda/
            │       ├── main.tf
            │       ├── variables.tf
            │       └── outputs.tf
            │   └── glue_database/
            │       ├── main.tf
            │       ├── variables.tf
            │       └── outputs.tf             
 
 
 
## Modules
 
### Glue Crawler
 
This module sets up AWS Glue Crawlers for data cataloging.
 
- **`main.tf`**: Defines the Glue Crawler resource, including its database, role, and targets.
- **`variables.tf`**: Contains input variables for configuring the Glue Crawler, such as the crawler name, role ARN, and S3 targets.
- **`outputs.tf`**: Outputs relevant information about the Glue Crawler, like the crawler name and ARN.
 
### Step Function
 
This module provisions AWS Step Functions state machines.
 
- **`main.tf`**: Defines the state machine and its IAM role.
- **`variables.tf`**: Specifies input variables such as state machine definition, role ARN, and logging configurations.
- **`outputs.tf`**: Outputs relevant information about the state machine, like its ARN and name.
 
### Glue Jobs
 
This module creates AWS Glue jobs for ETL tasks.
 
- **`main.tf`**: Defines the Glue job resource, its IAM role, and configurations.
- **`variables.tf`**: Contains input variables for the Glue job, such as job name, script location, and default arguments.
- **`outputs.tf`**: Outputs relevant information about the Glue job, like the job name and ARN.
 
 
### Lambda
 
This module provisions AWS Lambda functions.
 
- **`main.tf`**: Defines the Lambda function resource, its IAM role, and configurations.
- **`variables.tf`**: Contains input variables for the Lambda function, such as function name, runtime, handler, and memory size.
- **`outputs.tf`**: Outputs relevant information about the Lambda function, like its ARN and name.

### Glue Database

This module provisions AWS Glue Database.

- **`main.tf`**: Defines the Glue database resource, including its name and optional description. This file contains the core configuration needed to create and manage the Glue database.
- **`variables.tf`**: Contains input variables for configuring the Glue database.
- **`outputs.tf`**: Outputs relevant information about the Glue database.
 
## Usage
 
1. **Clone the Repository**:
    ```bash
    git clone <repository-url>
    ```
 
2. **Navigate to the desired module**:
    ```bash
    cd iac/terraform/modules/<module-name>
    ```
 
3. **Initialize Terraform**:
    ```bash
    terraform init
    ```
 
4. **Plan and Apply**:
    - Plan the infrastructure changes:
        ```bash
        terraform plan -var-file=<path-to-your-variables-file>.tfvars
        ```
    - Apply the changes:
        ```bash
        terraform apply -var-file=<path-to-your-variables-file>.tfvars
