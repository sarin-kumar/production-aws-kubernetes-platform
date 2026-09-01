# Architecture

## Request path

Internet
→ AWS Application Load Balancer
→ Kubernetes Ingress
→ Frontend/Backend Service
→ Pods
→ RDS PostgreSQL

## Delivery path

Developer
→ GitHub
→ GitHub Actions
→ tests/security scan
→ Docker image
→ ECR
→ Argo CD
→ EKS

## Infrastructure path

Terraform
→ VPC
→ subnets/NAT
→ IAM
→ EKS/node group
→ ECR
→ RDS
