# Prometheus

Recommended next step: install `kube-prometheus-stack` using Helm.

Example:

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install monitoring prometheus-community/kube-prometheus-stack \
  --namespace monitoring --create-namespace
```

Then configure ServiceMonitors for application-specific metrics.
