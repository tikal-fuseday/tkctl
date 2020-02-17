variable "region" { 
  type = string
  default = "us-east-1" 
}

variable "cluster_name" {
  type = string
  default = ""
  }

variable "endpoint_private_access" {
  default = true
}

variable "endpoint_public_access" {
  default = true
}

variable "security_group_ids" {
  type = list(string)
  default = []
}

variable "subnet_ids" {
  type = list(string)
  default = []
}

variable "role_arn" {
  type = string
  default = ""
}

variable "role_name" {
  type = string
  default = ""
}

variable "role_ocean_arn" {
  type = string
  default = "arn:aws:iam::475721568957:role/tr-ocean-role"
}

variable "ops_user" {
  type = string
  default = "arn:aws:iam::475721568957:user/ops_api_key_qa"
}

variable "cluster_version" {
  type = string
  default = "1.14"
}

variable "cluster_create_timeout" {  
  type = string
  default = "30m"
  description = "Timeout value when creating the EKS cluster."
}

variable "cluster_delete_timeout" {  
  type = string
  default = "30m"
  description = "Timeout value when deleting the EKS cluster."
}

variable "provider_kubernetes_host" {
  type = string
  default = ""
}

variable "provider_kubernetes_config_context_auth_info" {
  type = string
  default = ""
}

variable "provider_kubernetes_config_context_cluster" {
  type = string
  default = ""
}

variable "etcd_cluster" {
  type = string
  default = "etcd-us-east-1.trusteerqa.com"
}

variable "bastion_instance_count" {
  default = 1
}

variable "bastion_instance_type" {
  type    = string
  default = "m4.large"
}


variable "bastion_subnets_map" {
   type = map(list(string))
}
variable "ami_version" {
  type    = string
  default = "amzn2"
}

variable "environment" {
  type    = string
  default = "qa"
}

variable "project" {
}