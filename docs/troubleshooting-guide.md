# 🧰 Troubleshooting Guide – IBM MQ + ACE Deployment
## 1. CSI Secret Not Mounting?
- ✅ Check that your secrets in Google Secret Manager are:
 - Enabled
 - Assigned the correct IAM roles (e.g., Secret Manager Accessor)
- ✅ Confirm file-based secret format — not JSON blob
- ✅ Ensure volume mountPath in Helm matches container expectations
## 2. Pod CrashLoopBackOff?
- 🔍 Run:
 kubectl describe pod <pod-name>
Common errors:
• Missing secret files
• Permissions issues on mount
• Invalid MQ config (e.g., mqwebuser.xml misformatted)
## 3. Argo CD App Stuck in Progressing?
🔧 Fix:
• Check diff tab for Helm overrides
• Confirm values.yaml matches environment config
• Check Argo CD logs for sync errors
## 4. Harbor Deploy Key Error?
Solution:
• Rotate or recreate the deploy key
• Remove it from any other repo using the same key
## 5. Argo CD App not syncing automatically?
🔧 Check:
• automated: selfHeal: true in App manifest
• Argo CD has permission to access repo + cluster
