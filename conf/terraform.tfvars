region = "us-east-1"
name = "vpc1"
cidr = "10.1.0.0/16"

azs  = 
private_subnets     = ["${var.private_subnets_cidr}"]
private_subnet_tags = "${var.private_subnet_tags}"
public_subnets      = ["${var.public_subnets_cidr}"]
public_subnet_tags  = "${var.public_subnet_tags}"

enable_dns_hostnames    = "${var.enable_dns_hostnames}"
enable_nat_gateway      = "${var.enable_nat_gateway}"
instance_tenancy        = "${var.instance_tenancy}"
tags = {
Terraform   = "true"
Environment = "${var.env}"
#Owner       = "${var.owner}"
}
