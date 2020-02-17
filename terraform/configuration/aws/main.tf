provider "aws" {
  region = "${var.region}"
}

module "vpc" {
    source = "../../modules/aws-vpc"

    name = "${var.name}"
    cidr = "${var.cidr}"

    azs                 = ["${var.region}a", "${var.region}b", "${var.region}c"]
    private_subnets     = "${var.private_subnets}"
    private_subnet_tags = "${var.private_subnet_tags}"
    public_subnets      = "${var.public_subnets}"
    public_subnet_tags  = "${var.public_subnet_tags}"

    enable_dns_hostnames    = "${var.enable_dns_hostnames}"
    enable_nat_gateway      = "${var.enable_nat_gateway}"
    instance_tenancy        = "${var.instance_tenancy}"
    tags = {
      Terraform   = "true"

      #Owner       = "${var.owner}"
    }
    
  }
