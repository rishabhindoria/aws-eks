## Ingress Setup Kubernetes

### Setup permissions for ingress

`kubectl apply -f alb-rbac-role.yaml`

### Replace values for your AWS Region and EKS CLuster name in `alb-ingress-controller.yaml` file

```
# Name of your cluster. Used when naming resources created
# by the ALB Ingress Controller, providing distinction between
# clusters.
- --cluster-name=
```

```
# AWS region this ingress controller will operate in. 
# If unspecified, it will be discovered from ec2metadata.
# List of regions: http://docs.aws.amazon.com/general/latest/gr/rande.html#vpc_region
- --aws-region=
```

### Apply file

`kubectl apply -f alb-ingress-controller.yaml`

### Replace appropriate values in `alb-ingress-definition.yaml` file as mentioned

### Apply file

`kubectl apply -f alb-ingress-definition.yaml`

### You should now be able to open any of the HOST URL in the above definition file in browser to see if it works!