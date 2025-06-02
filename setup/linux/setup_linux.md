# 🐧 Setup do Ambiente Linux – Cloud Networking Lab

Este guia fornece as etapas para configurar um ambiente Linux robusto para simulações, automações e experimentação prática com redes em nuvem (AWS e Azure), usando CLI, ferramentas de VPN, Terraform e scripts.

---

## 📦 Requisitos

| Ferramenta        | Comando / Link                                               |
|-------------------|--------------------------------------------------------------|
| AWS CLI           | `sudo apt install awscli` ou [Docs](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) |
| Azure CLI         | `curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash`     |
| Terraform         | `wget https://releases.hashicorp.com/...` + `sudo mv`        |
| OpenVPN           | `sudo apt install openvpn`                                   |
| StrongSwan        | `sudo apt install strongswan` (para IPsec)                   |
| WireGuard         | `sudo apt install wireguard`                                 |
| Git               | `sudo apt install git`                                       |

---

## 🛠️ Passo a Passo

### 1. Atualize o sistema

```bash
sudo apt update && sudo apt upgrade -y
```

---

### 2. Instale ferramentas principais
```bash
sudo apt install awscli git unzip curl jq -y
```

---

### 3. Instale o Terraform
```bash
wget https://releases.hashicorp.com/terraform/1.6.6/terraform_1.6.6_linux_amd64.zip
unzip terraform_1.6.6_linux_amd64.zip
sudo mv terraform /usr/local/bin/
terraform -v
```

---

### 4. Azure CLI
```bash
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
az login
```

---

### 5. IPsec com StrongSwan (usado para simular conexões site-to-site)
```bash
sudo apt install strongswan libcharon-extra-plugins -y
```

---

### 6. WireGuard (opcional)
```bash
sudo apt install wireguard -y
```

---

## 🧪 Testando

1. Verifique conectividade com AWS:
```bash
aws sts get-caller-identity
```
   
2. Verifique conectividade com Azure:
```bash
az account show
```

3. Teste Terraform:
```bash
terraform -v
```

---

✅ Ambiente Linux Pronto - OK!
