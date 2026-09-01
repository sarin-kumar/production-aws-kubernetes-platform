# Failure Drills

Each drill should eventually contain real evidence captured from the running EKS environment.

| Scenario | Primary evidence |
|---|---|
| CrashLoopBackOff | get/describe/logs/previous logs |
| ImagePullBackOff | pod events, ECR image/tag, IAM |
| Pod Pending | scheduler events, requests, node capacity |
| OOMKilled | pod status, metrics, resource limits |
| Ingress failure | ingress/service/endpoints/controller logs |
| DB connectivity | endpoint, network path, secret/config handling |
