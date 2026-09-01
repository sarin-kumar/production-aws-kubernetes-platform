# ImagePullBackOff

## Symptoms

Kubernetes cannot pull the container image.

## Evidence

```bash
kubectl describe pod <pod> -n platform
```

## Investigation

Check ECR repository, image name/tag, image existence, node IAM permissions, registry connectivity, and image pull secrets if used.

## Resolution

Fix the image reference or AWS permissions and restart/redeploy.

## Prevention

Use immutable image tags and CI validation.
