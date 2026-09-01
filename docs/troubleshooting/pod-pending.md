# Pod Pending

## Evidence

```bash
kubectl get pods -n platform
kubectl describe pod <pod> -n platform
kubectl get nodes
kubectl describe nodes
```

## Investigation

Look at scheduling events, CPU/memory requests, node capacity, taints/tolerations, node selectors, affinity, and autoscaling.

## Resolution

Adjust resources, scheduling constraints, or node capacity as appropriate.
