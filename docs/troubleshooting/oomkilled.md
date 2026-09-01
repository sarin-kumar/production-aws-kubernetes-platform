# OOMKilled

## Evidence

```bash
kubectl describe pod <pod> -n platform
kubectl top pod -n platform
```

## Investigation

Compare observed memory usage with container memory limits. Check application memory behavior and traffic patterns.

## Resolution

Fix application memory usage and/or set realistic requests and limits.

## Prevention

Load testing, memory dashboards, alerts, and appropriate HPA/resource settings.
