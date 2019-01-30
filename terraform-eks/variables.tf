# Variables Configuration

variable "cluster-name" {
  default     = "eks-demo"
  type        = "string"
  description = "The name of your EKS Cluster"
}

variable "aws-region" {
  default     = "us-east-1"
  type        = "string"
  description = "The AWS Region to deploy EKS"
}

variable "vpc-cidr" {
  default     = "10.0.0.0/16"
  type        = "string"
  description = "The VPC CIDR"
}

variable "vpc-public-cidrs" {
  default     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
  type        = "list"
  description = "The VPC public-subnet CIDR"
}

variable "vpc-private-cidrs" {
  default     = ["10.0.10.0/23", "10.0.12.0/23", "10.0.14.0/23"]
  type        = "list"
  description = "The VPC private-subnet CIDR"
}

variable "instance-type" {
  default     = "m4.large"
  type        = "string"
  description = "Worker Node EC2 instance type"
}

variable "asg-desired" {
  default     = 1
  type        = "string"
  description = "Autoscaling Desired node capacity"
}

variable "asg-max" {
  default     = 1
  type        = "string"
  description = "Autoscaling maximum node capacity"
}

variable "asg-min" {
  default     = 1
  type        = "string"
  description = "Autoscaling Minimum node capacity"
}
