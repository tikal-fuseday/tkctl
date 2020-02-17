provider "aws" {
  #version = ">= 1.47.0"
  region  = var.region
}


resource "null_resource" "base" {
  provisioner "local-exec" {
    command = <<EOF
        #!/bin/bash
        set -x
        echo "Sleeping 20 seconds"
        sleep 20
        aws sts get-caller-identity
        aws eks update-kubeconfig --name ${var.cluster_name} --region ${var.region}
        kubectl config view
        cat ~/.kube/config
        sleep 4
        export VAR_ROLE_OCEAN_ARN=${var.role_ocean_arn}
        export OPS_USER=${var.ops_user}
        envsubst < ${path.module}/configmap/aws-auth.yaml | kubectl -n kube-system apply -f -
        sleep 4
        envsubst < ${path.module}/configmap/aws-auth.yaml | kubectl -n kube-system apply -f -
        sleep 4
        kubectl apply -f ${path.module}/storageclass/sc-slow.yaml
        sleep 4
        kubectl get cm aws-auth -n kube-system -o yaml
        etcdctl --timeout 30s --ca-file /tmp/ca.pem --endpoints https://${var.etcd_cluster}:2379 set eks/${var.cluster_name} $(kubectl config view)

        kubectl create clusterrolebinding cluster-system-anonymous --clusterrole=cluster-admin --user=system:anonymous
        
        sleep 4
        kubectl describe  clusterrolebinding cluster-system-anonymous
        kubectl -n kube-system patch configmap coredns --type merge  --patch  '{"data": {"Corefile": ".:53 {\n    errors\n    health\n    kubernetes cluster.local in-addr.arpa ip6.arpa {\npods insecure\n      upstream\n      fallthrough in-addr.arpa ip6.arpa\n    }\n    prometheus :9153\n    proxy . /etc/resolv.conf\n    forward . 8.8.8.8\n    cache 30\n}"}}'
        sleep 5
        kubectl -n kube-system delete pod $(kubectl -n kube-system get pod -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' | grep coredns)
        #kubectl -n kube-system patch configmap coredns --type merge  --patch  '{"metadata": {"annotations": {"kubectl.kubernetes.io/last-applied-configuration": "{\"apiVersion\":\"v1\",\"data\":{\"Corefile\":\".:53 {\\n    errors\\n    health\\n    kubernetes cluster.local in-addr.arpa ip6.arpa {\\n      pods insecure\\n      upstream\\n      fallthrough in-addr.arpa ip6.arpa\\n    }\\n    prometheus :9153\\n    proxy . /etc/resolv.conf\\n  forward . 8.8.8.8\\n  cache 30\\n}\\n\"},\"kind\":\"ConfigMap\",\"metadata\":{\"annotations\":{},\"labels\":{\"eks.amazonaws.com/component\":\"coredns\",\"k8s-app\":\"kube-dns\"},\"name\":\"coredns\",\"namespace\":\"kube-system\"}}"}}}'
        sleep 5
        kubectl -n kube-system get cm coredns -o yaml
      
EOF

  }
  depends_on = [aws_eks_cluster.base]
}

resource "aws_eks_cluster" "this" {
  name = var.cluster_name
  role_arn = var.role_arn
  version = var.cluster_version

  vpc_config {
    security_group_ids        = var.security_group_ids
    subnet_ids                = var.subnet_ids
    endpoint_private_access   = var.endpoint_private_access
    endpoint_public_access    = var.endpoint_public_access

  }
  tags = {
      "Project"        = var.project
      "Environment"    = var.environment
      "Role"           = "NA"
      "Services"       = "eks"
      "CostPerProduct" = "management"
  }
  timeouts {
    create = var.cluster_create_timeout
    delete = var.cluster_delete_timeout
  }
}

