# Ingress Failure

## Investigation

```bash
kubectl get ingress -n platform
kubectl describe ingress platform -n platform
kubectl get svc -n platform
kubectl get endpoints -n platform
kubectl get pods -n platform
```

For AWS Load Balancer Controller issues, inspect controller logs and AWS ALB target health.

## Request path

Ingress → Service → Endpoints → Pods

A break at any layer can cause the application to be unreachable.
