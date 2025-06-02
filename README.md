# 🌐 Advanced Cloud Networking Lab – AWS & Azure 🚀

[![AWS](https://img.shields.io/badge/AWS-Networking-orange?logo=amazon-aws&logoColor=white)](https://aws.amazon.com/networking/)
[![Azure](https://img.shields.io/badge/Azure-Virtual%20WAN-blue?logo=microsoft-azure&logoColor=white)](https://azure.microsoft.com/en-us/services/virtual-wan/)
[![Terraform](https://img.shields.io/badge/Terraform-IaC-purple?logo=terraform&logoColor=white)](https://developer.hashicorp.com/terraform)
[![Linux](https://img.shields.io/badge/Linux-Environment-yellow?logo=linux&logoColor=white)](https://ubuntu.com/)
[![Windows](https://img.shields.io/badge/Windows-Powershell-blue?logo=windows&logoColor=white)](https://docs.microsoft.com/powershell/)
[![Starlink](https://img.shields.io/badge/Starlink-Integration-gray?logo=spacex&logoColor=white)](https://www.starlink.com/)

---

## 📚 Sobre este Projeto

Este repositório foi criado como um laboratório técnico pessoal, focado em Cloud Networking avançado com AWS e Azure. Ele inclui ambientes de simulação, guias de configuração, automação com Terraform e casos de uso do mundo real, incluindo integrações com Starlink e links dedicados como Direct Connect e ExpressRoute.

---

## 📁 Estrutura do Repositório

| Caminho                                 | Descrição                                                              |
|----------------------------------------|------------------------------------------------------------------------|
| [`README.md`](./README.md)             | Documentação principal e visão geral                                  |
| [`setup/`](./setup/)                   | Configuração de ambiente (Linux e Windows)                            |
| [`aws/`](./aws/)                       | Casos de uso AWS: TGW, DXGW, Route Tables, VPNs                        |
| [`azure/`](./azure/)                   | Casos de uso Azure: Virtual WAN, ER, Peering                          |
| [`hybrid/`](./hybrid/)                 | Integração AWS ↔ Azure + Starlink                                      |
| [`terraform/`](./terraform/)           | Infraestrutura como código para todos os ambientes                    |
| [`diagrams/`](./diagrams/)             | Diagramas arquiteturais (SVG, PNG, Draw.io)                           |
| [`docs/`](./docs/)                     | Materiais de apoio, cheatsheets, links úteis                          |

---

## 🛠️ Instalação e Configuração

Guia passo a passo para preparar seu ambiente de simulação:

- [Linux: Instalação e Setup](./setup/linux/setup_linux.md)
- [Windows: Instalação e Setup](./setup/windows/setup_windows.md)

---

## 🔍 Casos de Uso em Destaque

| Categoria     | Caso                                                       |
|---------------|-------------------------------------------------------------|
| AWS           | [TGW com múltiplas VPCs e DXGW](./aws/tgw_with_dxgw.md)     |
| Azure         | [Virtual WAN + Peering + ExpressRoute](./azure/vwan_er.md)  |
| Multi-Cloud   | [Integração AWS ↔ Azure com BGP e túnel IPsec](./hybrid/aws_azure_vpn.md) |
| Satélite      | [Conectividade Starlink com Cloud](./hybrid/starlink_setup.md) |

---

## 🔁 Automação com Terraform

Todos os cenários podem ser provisionados com código usando:

- [Terraform AWS](./terraform/aws/)
- [Terraform Azure](./terraform/azure/)
- [Terraform Multi-Cloud](./terraform/hybrid/)

---

## 📄 Licença

Este projeto é de uso pessoal e educativo. Licenciado sob [MIT](./LICENSE).

---
