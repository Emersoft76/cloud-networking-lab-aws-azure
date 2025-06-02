# 🪟 Setup do Ambiente Windows – Cloud Networking Lab

Este guia orienta a instalação das ferramentas necessárias para criar um ambiente de experimentação em redes de nuvem AWS e Azure, usando PowerShell, WSL2 e Terraform.

---

## 📦 Requisitos

| Ferramenta         | Link de Instalação                                         |
|--------------------|------------------------------------------------------------|
| AWS CLI            | [aws.amazon.com/cli](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-windows.html) |
| Azure CLI          | [Microsoft Docs](https://learn.microsoft.com/cli/azure/install-azure-cli-windows) |
| Terraform          | [HashiCorp](https://developer.hashicorp.com/terraform/downloads) |
| Git for Windows    | [git-scm.com](https://git-scm.com/download/win)            |
| WSL2 + Ubuntu      | [WSL2 Setup](https://learn.microsoft.com/windows/wsl/)     |
| Windows Terminal   | [Microsoft Store](https://aka.ms/terminal)                 |

---

## 🛠️ Passo a Passo

### 1. Habilite o WSL2 + Ubuntu

No PowerShell (Admin):

```powershell
wsl --install
```

Após reiniciar, abra o Ubuntu e execute:
```bash
sudo apt update && sudo apt install unzip curl git awscli -y
```

---

2. Instale o AWS CLI

- Baixe o instalador: CLI AWS Windows

---

3. Instale o Azure CLI

- Baixe o instalador: CLI Azure Windows

---

4. Instale o Terraform

- Baixe e extraia o binário: Terraform Download
- Adicione ao PATH

---

5. Git para Windows

- Instale: Git

---

6. Ferramentas de VPN (opcional)

- Instale WireGuard para Windows

- Para IPsec: use simulações via VM/Linux ou Azure VPN Gateway

---

## 🧪 Testes
```powershell
aws sts get-caller-identity
az login
terraform -v
```

---

## ✅ Ambiente Windows Pronto - OK! 

- Operar redes em nuvem localmente e provisionar infraestruturas nuncq foi tão fácil! ;-)...

---
