output "kubeconfig" {
  value = "${module.eks-cluster.kubeconfig}"
}

output "config-map" {
  value = "${module.eks-cluster.config_map_aws_auth}"
}
