# AWS
region = "us-east-1"
name   = "vpc1"
cidr   = "10.10.0.0/16"

#azs  = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
private_subnets     = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
private_subnet_tags = {
  type = "Stam"
}
public_subnets     = ["10.10.11.0/24", "10.10.12.0/24", "10.10.13.0/24"]
public_subnet_tags = {
  type = "Stam"
}
enable_dns_hostnames = true
enable_nat_gateway   = true
instance_tenancy     = "default"
tags = {
  Terraform   = "true"
  Environment = "prod"
  Owner       = "user"
}
