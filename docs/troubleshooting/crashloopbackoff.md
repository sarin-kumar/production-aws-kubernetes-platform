# CrashLoopBackOff

## Symptoms

Pod repeatedly restarts.

## Evidence

```bash
kubectl get pods -n platform
kubectl describe pod <pod> -n platform
kubectl logs <pod> -n platform
kubectl logs <pod> -n platform --previous
```

## Investigation

Check startup errors, environment variables, secrets, probes, dependency availability, and container command.

## Root cause

Record the exact root cause observed during the failure drill.

## Resolution

Correct configuration/application issue and redeploy.

## Prevention

Add tests, health checks, safer startup validation, and alerts.
