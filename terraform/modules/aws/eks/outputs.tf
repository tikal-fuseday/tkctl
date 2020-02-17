output "cluster_id" {
  description = "The name/id of the EKS cluster."
  value       = aws_eks_cluster.base.id
}

output "cluster_name" {
  description = "The name/id of the EKS cluster."
  value       = aws_eks_cluster.base.name
}

# Though documented, not yet supported
# output "cluster_arn" {
#   description = "The Amazon Resource Name (ARN) of the cluster."
#   value       = "${aws_eks_cluster.this.arn}"
# }

output "cluster_certificate_authority_data" {
  description = "Nested attribute containing certificate-authority-data for your cluster. This is the base64 encoded certificate data required to communicate with your cluster."
  value       = aws_eks_cluster.base.certificate_authority[0].data
}

output "cluster_endpoint" {
  description = "The endpoint for your EKS Kubernetes API."
  value       = aws_eks_cluster.base.endpoint
}

output "cluster_version" {
  description = "The Kubernetes server version for the EKS cluster."
  value       = aws_eks_cluster.base.version
}

output "cluster_security_group_ids" {
  description = "Security group ID attached to the EKS cluster."
  value       = var.security_group_ids
}

output "cluster_role_arn" {
  description = "role_arn EKS cluster."
  value       = aws_eks_cluster.base.role_arn
}

output "cluster_role_name" {
  description = "role_arn EKS cluster."
  value       = var.role_name
}

