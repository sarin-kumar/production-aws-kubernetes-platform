# Deployment Guide

## 1. Provision infrastructure

Configure AWS credentials locally and review Terraform variables.

```bash
cd terraform/environments/prod
terraform init
terraform validate
terraform plan
```

Apply only after reviewing the plan.

## 2. Configure kubectl

After EKS is created:

```bash
aws eks update-kubeconfig --region ap-south-1 --name production-platform
kubectl get nodes
```

## 3. Push images

Create/update ECR repositories and push frontend/backend images.

## 4. Configure database secret

Create the Kubernetes secret without committing it:

```bash
kubectl create secret generic backend-db \
  --namespace platform \
  --from-literal=DATABASE_URL='postgres://USER:PASSWORD@RDS_ENDPOINT:5432/platform'
```

## 5. Deploy

Use either raw manifests or Helm/Argo CD.

```bash
helm upgrade --install platform ./helm/production-platform \
  --namespace platform --create-namespace
```
