# Resume Bullets – IBM MQ GitOps Project
- Deployed IBM MQ and ACE on GKE using Helm charts and GitOps via Argo CD, integrating CSI-mounted secrets from Google Secret Manager for secure credential and cert injection.
- Built and migrated CI/CD pipelines using Cloud Build and NitroDX for container image builds, storing images in Harbor registry for Argo CD consumption.
- Designed and implemented Argo CD App-of-Apps structure enabling environment-based Helm deployments with namespace restrictions.
- Configured GCP Secret Manager secrets for CSI mounting, including legacy MQ UI files (`ltpa.keys`, `mqwebuser.xml`) and MQ TLS certs (`key.kdb`, `key.sth`, etc.).
- Troubleshot and resolved real-world deployment issues including CrashLoopBackOff from invalid secret mounts, Helm chart overrides, and Argo CD sync errors.
- Demonstrated end-to-end DevOps automation from Git commit → Cloud Build → Harbor → Argo CD sync → GKE deployment with zero manual intervention.
