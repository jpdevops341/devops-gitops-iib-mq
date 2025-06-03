# 🚀 IBM MQ + ACE GitOps Deployment on GKE

This project showcases a production-style GitOps deployment of IBM MQ and ACE workloads on Google Kubernetes Engine (GKE) using Helm, Argo CD, Google Secret Manager (via CSI driver), Harbor registry, and NitroDX (Google Cloud Deploy).

It demonstrates a real-world DevOps setup with secure secret management, image delivery pipelines, Helm-based infrastructure-as-code, and Argo CD-based GitOps automation.

---

## 🧰 Tech Stack

| Tool/Service           | Purpose                                  |
|------------------------|------------------------------------------|
| GKE (GCP)              | Kubernetes platform                      |
| IBM MQ / ACE           | Enterprise middleware workloads          |
| Helm                   | Kubernetes package management            |
| Argo CD                | GitOps continuous delivery               |
| Harbor Registry        | Secure image hosting                     |
| Google Secret Manager  | Secret injection (via CSI)               |
| Cloud Build / NitroDX  | CI/CD pipelines                          |
| Skaffold               | Helm deployment config for NitroDX       |

---

## 📦 Features

- 🔐 **Secrets via CSI** – injects certs, keys, and config into pods from Google Secret Manager
- 🎯 **Argo CD GitOps** – App-of-Apps structure for managing MQ and ACE independently
- 🏗️ **Helm Modularization** – separate Helm charts for IBM MQ and ACE
- 🐳 **Harbor Registry Integration** – supports private image hosting with key-based authentication
- 🚀 **CI/CD Ready** – Skaffold-based build/deploy pipeline for use with NitroDX or local CLI
- 📁 **Clean Structure** – organized codebase for real-world team use or portfolio showcasing

---

## 📂 Folder Structure

```bash
devops-gitops-iib-mq-ace/
├── helm-charts/                 # Helm charts for MQ and ACE
│   ├── iib-mq/
│   └── iib-ace/
├── argocd/                      # Argo CD application definitions
├── pipelines/                   # Cloud Build and NitroDX pipeline configs
├── secrets/                     # GSM docs, formatting guide, bootstrap script
├── docs/                        # Setup guide, project overview, resume bullets
├── skaffold.yaml                # Main deployment config for Skaffold/NitroDX
├── README.md                    # ← You are here
```

---

## 🔧 CI/CD with Skaffold and NitroDX

This project uses Skaffold to deploy Helm charts for both IBM MQ and ACE via NitroDX or locally via CLI.

To run deployments:

- 🚀 Deploy both MQ & ACE:
  ```bash
  skaffold run
  ```

- 🧪 Deploy MQ only:
  ```bash
  skaffold run -p mq-only
  ```

- 🧪 Deploy ACE only:
  ```bash
  skaffold run -p ace-only
  ```

The `skaffold.yaml` config defines artifacts, Helm charts, and profiles for both services. It can be integrated directly into **Google Cloud Deploy (NitroDX)**.

---

## 🔐 Secrets via Google Secret Manager (CSI)

Secrets used include:
- `mq-key-kdb`, `mq-key-rdb`, `key.sth` – TLS cert files
- `ltpa.keys`, `mqwebuser.xml` – MQ Web UI configs
- `mqdevkeystore.jks`, `mqdevtruststore.jks` – optional ACE keystores
- `DEV_SECRETS` – MQ credentials

To automate setup, use:
```bash
bash secrets/gsm-bootstrap.sh
```

Mounting is handled via `SecretProviderClass` objects defined in the Helm templates.

---

## 📸 Architecture Diagram

![Architecture](docs/architecture-diagram.png)

---

## 📘 How to Use

1. Clone the repo:
   ```bash
   git clone https://github.com/jpdevops341/devops-gitops-iib-mq-ace.git
   cd devops-gitops-iib-mq-ace
   ```

2. Upload secrets to GSM (see `secrets/gsm-bootstrap.sh`)
3. Set up Argo CD and apply:
   ```bash
   kubectl apply -f argocd/app-of-apps.yaml
   ```
4. Sync Argo CD apps and validate MQ and ACE pods
5. Trigger build via Cloud Build or NitroDX

---

## 💼 Resume-Ready Impact

- ✅ Demonstrates GitOps, Helm, and multi-service orchestration
- ✅ Real-world handling of secret injection via GCP CSI
- ✅ Aligns with modern enterprise DevOps stacks

> 📎 See `docs/resume-bullets.md` for full interview-ready bullet points.

---

## 👤 Author

**Jyothi P (jpdevops341)**  
DevOps Engineer | GitOps Enthusiast | GCP + Kubernetes + Argo CD  

---

## 📜 License

MIT License – Use freely for learning, interviews, and team reference.
