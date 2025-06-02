# devops-gitops-iib-mq
#Deployment using Helm Charts, ArgoCD, Harbor and GCP Secret Manager(CSI drivers) in GKE
# IBM MQ & ACE GitOps Deployment on GKE

## 🚀 Project Overview

This project demonstrates a production-style GitOps deployment pipeline for IBM MQ and ACE applications using Helm charts, Argo CD, NitroDX/Cloud Build, Harbor Registry, and Google Secret Manager (via CSI driver) — all within a GKE environment.

It's modeled after real-world DevOps workflows in enterprise settings (e.g., healthcare, finance), where secure secret management, image compliance, and GitOps automation are critical.

## 💡 Key Highlights

- 🔐 CSI driver-based secret injection from Google Secret Manager

- 🚀 GitOps-based deployments using Argo CD (including App-of-Apps)

- 🏗️ Helm chart modularization for IBM MQ & ACE components

- 📦 Container images stored in Harbor and built via NitroDX pipeline

- 🛡️ Namespace-restricted GKE cluster deployments with secure access

## 🎯 Objectives

- Replicate and showcase enterprise-grade GitOps deployment for interview/portfolio

- Demonstrate real problem-solving: file-based secret mounting, image registry migration, CSI integration, and Argo CD sync issues

## 🧠 Technologies Used

| Tool            | Purpose                                  |

|-----------------|------------------------------------------|

| GKE             | Kubernetes runtime                       |

| IBM MQ / ACE    | Middleware applications                  |

| Argo CD         | GitOps continuous deployment             |

| Helm            | Kubernetes package management            |

| Harbor          | Container image registry                 |

| Google Secret Manager | Secrets storage (with CSI driver) |

| Cloud Build / NitroDX | CI pipeline for building & pushing |

## 🔐 Note on Secrets

All secrets used in this repo are placeholders. Real deployments rely on GCP-managed secrets injected at runtime using the Secrets Store CSI driver.
 
