Deploy a full AWS EKS cluster with Terraform

## What resources are created

1. VPC
2. Internet Gateway (IGW)
3. Public and Private Subnets
4. Security Groups, Route Tables and Route Table Associations
5. IAM roles, instance profiles and policies
6. An EKS Cluster
7. Autoscaling group and Launch Configuration
8. Worker Nodes in a private Subnet
9. The ConfigMap required to register Nodes with EKS
10. KUBECONFIG file to authenticate kubectl

## Configuration

You can configure you config with the following input variables:

| Name                 | Description                       | Default                                            |
|----------------------|-----------------------------------|----------------------------------------------------|
| `cluster-name`       | The name of your EKS Cluster      | `eks-demo`                                         |
| `aws-region`         | The AWS Region to deploy EKS      | `us-east-1`                                        |
| `instance-type`      | Worker Node EC2 instance type     | `m4.large`                                         |
| `asg-desired`        | Autoscaling Desired node capacity | `1`                                                |
| `asg-max`            | Autoscaling Maximum node capacity | `1`                                                |
| `asg-min`            | Autoscaling Minimum node capacity | `1`                                                |
| `vpc-cidr`           | VPC CIDR                          | `10.0.0.0/16`                                      |
| `vpc-public-cidrs`   | VPC Public subnets                | `["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]`    |
| `vpc-private-cidrs`  | VPC Private subnets               | `["10.0.10.0/23", "10.0.12.0/23", "10.0.14.0/23"]` |

### Terraform

You need to run the following commands to create the resources with Terraform:

```bash
terraform init
terraform plan -out eks-demo
terraform apply "eks-demo"
```

### Setup kubectl

Setup your `KUBECONFIG`

```bash
terraform output kubeconfig > ${HOME}/.kube/config-eks-demo
export KUBECONFIG=$KUBECONFIG:~/.kube/config-eks-demo
echo 'export KUBECONFIG=$KUBECONFIG:~/.kube/config-eks-demo' >> ~/.bash_profiles   (macOSX)

or

echo 'export KUBECONFIG=$KUBECONFIG:~/.kube/config-eks-demo' >> ~/.bashrc  (linux)
```

### Authorize worker nodes

Get the config from terraform output, and save it to a yaml file:

```bash
terraform output config-map > config-map-aws-auth.yaml
```

Apply the config map to EKS:

```bash
kubectl apply -f config-map-aws-auth.yaml
```

You can verify the worker nodes are joining the cluster and becoming ready

```bash
kubectl get nodes --watch
```

Great EKS is all setup! head over to other folders and start deploying....

### Cleaning up

You can destroy this cluster and vpc entirely by running:

```bash
terraform destroy
```

## Helpful links

https://docs.aws.amazon.com/eks/latest/userguide/getting-started.html

https://eksworkshop.com/terraform/module.html

https://docs.aws.amazon.com/eks/latest/userguide/create-kubeconfig.html
