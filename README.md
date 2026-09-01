# Production AWS Kubernetes Platform

A production-oriented AWS Kubernetes platform demonstrating Infrastructure as Code, containerization, CI/CD, GitOps, observability, and Kubernetes troubleshooting.

## Architecture

```text
Developer -> GitHub -> GitHub Actions -> Docker -> Amazon ECR
                                              |
                                              v
                                           Amazon EKS
                                         /     |      \
                                   Frontend  Backend   RDS
                                              |
                                      Prometheus/Grafana

Terraform -> VPC / IAM / EKS / ECR / RDS
Argo CD   -> GitOps deployment to EKS
```

## Repository Structure

- `app/` - React frontend and Node.js/Express backend
- `docker/` - local Docker Compose
- `kubernetes/` - raw Kubernetes manifests
- `helm/` - Helm chart
- `terraform/` - AWS infrastructure modules/environment
- `argocd/` - Argo CD GitOps resources
- `monitoring/` - Prometheus/Grafana configuration
- `docs/` - deployment and troubleshooting runbooks
- `.github/workflows/` - CI and image build workflows

## Technology Stack

AWS, EKS, ECR, VPC, IAM, RDS PostgreSQL, ALB, Terraform, Kubernetes, Helm, Argo CD, Docker, GitHub Actions, Prometheus, Grafana.

## Quick Start

### Local

```bash
docker compose -f docker/docker-compose.yml up --build
```

Frontend: http://localhost:3000  
Backend: http://localhost:8080/health

### Terraform

```bash
cd terraform/environments/prod
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform plan
# terraform apply
```

Review and customize networking, instance sizes, database settings, and AWS region before applying.

### Kubernetes

Build/push images to ECR, update the image references in `kubernetes/`, then:

```bash
kubectl apply -f kubernetes/namespace.yaml
kubectl apply -f kubernetes/frontend/
kubectl apply -f kubernetes/backend/
kubectl apply -f kubernetes/ingress.yaml
```

For GitOps, install Argo CD and apply `argocd/application.yaml`.

## Security Notes

- Never commit AWS credentials, database passwords, kubeconfigs, or `.tfvars` containing secrets.
- Production secrets should use AWS Secrets Manager/External Secrets or another approved secret-management solution.
- The Terraform RDS module is intentionally a starter implementation; harden encryption, backups, deletion protection, monitoring, and secret management before production use.

## Failure Drills

See `docs/troubleshooting/` for:

- CrashLoopBackOff
- ImagePullBackOff
- Pod Pending
- OOMKilled
- Ingress failure
- Database connectivity

## Roadmap

1. Provision AWS infrastructure with Terraform.
2. Push application images to ECR.
3. Deploy to EKS.
4. Configure ALB ingress.
5. Add Argo CD GitOps.
6. Install Prometheus/Grafana.
7. Run and document failure drills.
