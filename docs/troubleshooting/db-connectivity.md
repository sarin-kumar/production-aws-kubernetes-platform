# Database Connectivity

## Investigation

Check:

- Kubernetes Service/DNS where applicable
- `DATABASE_URL`
- Kubernetes Secret
- RDS endpoint
- RDS security group
- VPC routing
- EKS-to-RDS network path
- RDS status

## Evidence

```bash
kubectl describe pod <pod> -n platform
kubectl logs <pod> -n platform
kubectl get secret backend-db -n platform
```

Never print or commit the secret value.

## Resolution

Correct the network, endpoint, credentials, or application configuration causing the connection failure.
