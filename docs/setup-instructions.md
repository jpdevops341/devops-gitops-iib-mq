# 🚀 Setup Instructions – IBM MQ + ACE GitOps Deployment
## 1. Prerequisites
- A GKE cluster with Workload Identity enabled
- Helm 3 installed
- Argo CD installed and accessible
- Harbor registry access
- GCP Secret Manager access + IAM permissions
- CSI Driver (Secrets Store) installed in your cluster
  
## 2. Clone the Repo
 git clone https://github.com/jpdevops341/devops-gitops-iib-mq-ace.git 
cd devops-gitops-iib-mq-ace
## 3. Configure Google Secret Manager
Upload the following secrets manually or via script:
• mq-key-kdb
• mq-key-rdb
• key.sth
• ltpa.keys
• mqwebuser.xml
• Any required .jks files (ACE-specific)
Ensure:
• Secrets are file-based (not JSON blobs)
• IAM bindings are added for the GKE node SA:
roles/secretmanager.secretAccessor
## 4. Configure SecretProviderClass
Edit secretproviderclass.yaml in the MQ Helm chart with your actual:
• project ID
• secret names
• file names

## 5. Install the Helm Charts via Argo CD
Create the Argo CD App:
kubectl apply -f argocd/applications/iib-mq.yaml
kubectl apply -f argocd/applications/iib-ace.yaml
Or use App-of-Apps:
kubectl apply -f argocd/app-of-apps.yaml

## 6. Validate Deployment
• Confirm Argo CD shows “Healthy” and “Synced”
• Check MQ pod logs:
kubectl logs -l app=iib-mq
• Verify CSI-mounted files are available inside the pod at: •Verify CSI-mounted files are available inside the pod at:

## 7. Trigger CI/CD
For image updates:
• Push updated Dockerfiles or Helm values
• Cloud Build / NitroDX builds → pushes to Harbor → Argo CD syncs changes 
