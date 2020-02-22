---
sidebarDepth: 3
---

# Getting started

::: warning 
Because **tkctl** as of now relies on [Terraform](https://www.terraform.io/), we assume you are familiar enough with it. 
If not, please take a while to explore it.
:::

## Prerequisites

### Terraform

You must have **Terraform** installed on your computer. For now **tkctl** requires the `0.12.x` version of Terraform. 
Please refer to the [official guide](https://learn.hashicorp.com/terraform/getting-started/install.html) to install **Terraform**.

### Providers 

#### Account authentication

To enable **Terraform** to exploit the providers APIs, you must have created an account on the various providers and be aware of your credentials to access the APIs.

### Terraform backend [ WIP ]

You must have the credentials set to access the desired bucket on AWS S3 otherwise **Terraform** won't initialize. 
If needed, follow this [guide](https://docs.aws.amazon.com/sdk-for-java/v1/developer-guide/setup-credentials.html) to set up your credentials. 

## Installation

### Clone the Github repository

```bash
$ git clone https://github.com/tikal-fuseday/tkctl.git
$ cd tkctl
```

### Setup your Terraform environment

::: warning Security
Hard-coding credentials into any **Terraform** configuration is not recommended, and risks secret leakage should this file ever be committed to a public version control system.
We strongly recommend to store the credentials using environment variables.
:::

1. Define your **AWS** credentials

```bash
$export TF_VAR_AWS_ACCESS_KEY="<ACCESS-KEY>"
$export TF_VAR_AWS_SECRET_KEY="<SECRET-KEY>" 
```

2. Define your **Azure** credentials

3. Define your **Gcp** credentials

4. Define your base configuration

5. Define the [S3 backend](https://www.terraform.io/docs/backends/types/s3.html) properties 

Create a file `backend.config` with the following properties:

```
bucket = "the name of the bucket"
region = "the region of the bucket"
key    = "the key to the states"
```

6. Initialize Terraform via Tkctl

```sh
$ tkctl create --tf-backend-config="path/to/your/backend.config"
```

## Usage

### Create a project

```sh
$ tkctl project new demo
```

tkctl will automatically switch to the created project `demo`, this will be stored in the `~/tkctl/projects/demo` or the directory set by .tkctl.cfg in the current dir or `$TKCTL_HOME`

### Configure the project

### Apply the changes

### Check your infrastructure

### Destroy your infrastructure
