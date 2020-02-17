
//       Private Access K8S Cluster
provider "kubernetes" {
  host                   = module.eksX.cluster_endpoint
  username               = "arn:aws:eks:us-east-1:329054710135:cluster/k8s_3"
  cluster_ca_certificate = base64decode(module.eksX.cluster_certificate_authority_data)

  //token                    = "${data.aws_eks_cluster_auth.base.token}"
  config_context_auth_info = "arn:aws:eks:us-east-1:329054710135:cluster/k8s_3"
  config_context_cluster   = "arn:aws:eks:us-east-1:329054710135:cluster/k8s_3"
}

module "eksX" {
  source                                       = "../../../../modules/aws/resources/eks"
  cluster_name                                 = "k8s_3"
  security_group_ids                           = ["sg-042161c22a25c721b", "sg-053fd392b1e016da7", "sg-01e982791af439fde", "sg-0ff03cab3c6d1d52b"]
  subnet_ids                                   = ["subnet-023b1e761a1e94395", "subnet-0fe8abbfa9890f9c8", "subnet-0d4541afc2ab13ac7", "subnet-09d1ef4b2bbfcf9a1", "subnet-0e55aeecf3ffddd8d", "subnet-0477a626e4cc29262"]
  role_arn                                     = "arn:aws:iam::329054710135:role/tr-eks-role"
  ops_user                                     = "arn:aws:iam::329054710135:user/ops_api_key"
  role_name                                    = "tr-eks-role"
  role_ocean_arn                               = "arn:aws:iam::329054710135:role/tr-ocean-role"
  cluster_version                              = "1.14"
  provider_kubernetes_config_context_auth_info = "arn:aws:eks:us-east-1:329054710135:cluster/k8s_3"
  provider_kubernetes_config_context_cluster   = "arn:aws:eks:us-east-1:329054710135:cluster/k8s_3"
  etcd_cluster                                 = "etcd-us-east-1.trusteerqa.com"
  project                                      = "k8s_3"
  environment                                  = "production"

}

