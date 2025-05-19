> ⚠️ This application is **intentionally vulnerable**. It is built for demonstration purposes only. Do not deploy this in production environments.

# 🛡️ AegisFlow

**AegisFlow** is a modern, threat-aware CI/CD pipeline built to demonstrate **proactive DevSecOps automation**. It integrates real-world attacker techniques (via MITRE ATT&CK), threat intelligence (via AlienVault OTX), and full SBOM scanning to detect vulnerabilities **before code hits production**.

> 🧪 This project is intentionally vulnerable for educational and testing purposes only.

---

## 🚀 What It Does

AegisFlow scans your application for:

- 🔍 Insecure code patterns using **Semgrep** + MITRE ATT&CK mappings
- 📦 Dependency vulnerabilities using **Trivy**
- 🧾 Package-level metadata using **Syft SBOM**
- ☠️ Known malware IOCs using **AlienVault OTX**
- 🕵️ Simulated dark web targeting (optional)
- 📊 Output summary for security reports and interviews

---

## 📁 Project Structure

aegisflow/
├── app/                    # Vulnerable Flask app
├── semgrep-rules/          # Custom MITRE-tagged rules
├── .github/
│   └── workflows/
│       └── ci.yml          # GitHub Actions CI
├── sbom/                   # SBOM output via Syft
├── scripts/                # OTX + dark web scripts
├── reports/                # Results from Semgrep, Trivy, OTX
├── analysis/               # Summary script for CI logs
├── threat_model/           # STRIDE threat analysis + DFD diagram
├── requirements.txt        # Frozen Python dependencies
└── README.md               # Project documentation



---

## 📦 Technology Stack

| Area | Tool |
|------|------|
| Static Analysis (SAST) | [Semgrep](https://semgrep.dev) |
| Vulnerability Scanning | [Trivy](https://aquasecurity.github.io/trivy/) |
| SBOM Generation | [Syft](https://github.com/anchore/syft) |
| Threat Feeds | [AlienVault OTX](https://otx.alienvault.com) |
| Simulated Intel Feed | Dark Web API (mock) |
| CI/CD | GitHub Actions |
| App Framework | Python + Flask |

---

## ⚙️ How It Works

1. 🔍 **Semgrep** scans code using custom rules mapped to MITRE techniques:
   - e.g. `eval()` → MITRE `T1059` (Execution)

2. 📦 **Syft** generates a Software Bill of Materials from your app

3. 🧨 **Trivy** scans installed packages for known CVEs

4. 🚨 **OTX script** checks SBOM hashes against real-world malware indicators

5. 🕵️ **Dark web simulation** checks if the app appears on a watchlist

6. 📊 **Results are summarized** with MITRE references + IOC hits in CI logs

---

## 🔧 Setup Instructions

```bash
# Clone the repo
git clone https://github.com/paul-d/aegisflow.git
cd aegisflow

# Create and activate virtual environment
python3 -m venv venv
source venv/bin/activate

# Install Python requirements
pip install -r requirements.txt

# Run the app (for local test)
python app/main.py
```
--- 

## 🔁 GitHub Actions Pipeline
The CI/CD pipeline is triggered on each push to main.

It performs:

✅ Semgrep scan (custom MITRE rules)

✅ SBOM generation via Syft

✅ Trivy CVE scan

✅ IOC enrichment via AlienVault OTX

✅ Dark web lookup (mocked)

✅ Summary output via analysis/summarize.py

---

📌 Live CI badge:

---

## 🧠 Threat Modeling (STRIDE)
/eval → Tampering, Code Injection (T1059)

/shell → Execution, Privilege Escalation (T1202)

/pickle → Insecure Deserialization (T1609)

DFD diagram included in threat_model/dfd.png

---

## 📘 Educational Notes for Students
This repo is ideal for students or junior engineers to learn:

How to write secure code (by reviewing insecure examples)

What TTPs attackers actually use

How DevSecOps integrates with real threat intelligence

How to build and automate a modern security pipeline

---

## ⚠️ Disclaimer
This app contains intentional vulnerabilities. Do not deploy it in production. It is for educational and demonstration use only.

---

## 🙌 Credits
Created by Paul D.
With support from Open Threat Exchange, Semgrep, Trivy, and the MITRE ATT&CK framework.