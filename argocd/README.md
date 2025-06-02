# 🧩 Argo CD Configuration

This folder contains the Argo CD configuration for deploying IBM MQ and ACE Helm charts using GitOps.

## Structure

| File | Description |
|------|-------------|
| `app-of-apps.yaml` | The main Argo CD App-of-Apps definition |
| `applications/iib-mq.yaml` | ArgoCD app for the MQ Helm chart |
| `applications/iib-ace.yaml` | ArgoCD app for the ACE Helm chart |
| `project.yaml` | Defines an Argo CD project (`iib-integration`) to scope resources |
| `argocd-rbac-cm.yaml` | Optional RBAC rules for Argo CD UI and CLI access |

## How to Apply

1. Apply the Argo CD project:

```bash
kubectl apply -f argocd/project.yaml -n argocd
```

2. Deploy the App-of-Apps:
``
```bash
kubectl apply -f argocd/app-of-apps.yaml -n argocd
```

Argo CD will automatically sync and deploy `iib-mq` and `iib-ace` charts into GKE.

## RBAC Notes

To customize access control, update `argocd-rbac-cm.yaml` and apply:

```bash
kubectl apply -f argocd/argocd-rbac-cm.yaml -n argocd
```
