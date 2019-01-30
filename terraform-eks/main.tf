provider "aws" {
  region = "${var.aws-region}"
}

module "eks-vpc" {
  source            = "./modules/vpc"
  vpc-cidr          = "${var.vpc-cidr}"
  cluster-name      = "${var.cluster-name}"
  vpc-public-cidrs  = "${var.vpc-public-cidrs}"
  vpc-private-cidrs = "${var.vpc-private-cidrs}"
  aws-region        = "${var.aws-region}"
}

module "eks-cluster" {
  source            = "./modules/eks"
  vpc-id            = "${module.eks-vpc.vpc_id}"
  cluster-name      = "${var.cluster-name}"
  vpc-public-cidrs  = "${module.eks-vpc.public_subnets}"
  vpc-private-cidrs = "${module.eks-vpc.private_subnets}"
  instance-type     = "${var.instance-type}"
  asg-min           = "${var.asg-min}"
  asg-max           = "${var.asg-max}"
  asg-desired       = "${var.asg-desired}"
}
