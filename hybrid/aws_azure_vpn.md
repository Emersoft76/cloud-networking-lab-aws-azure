## 🎯 Objetivo

- Integrar workloads entre AWS e Azure
- Trocar rotas dinamicamente via BGP
- Alta disponibilidade com VPN redundante

---

## 🛠️ Componentes

| Cloud   | Componente                  |
|---------|-----------------------------|
| AWS     | Virtual Private Gateway (VGW) |
| AWS     | Customer Gateway (Azure)    |
| Azure   | Virtual Network Gateway     |
| Azure   | Local Network Gateway (AWS) |
| Ambos   | BGP ASN + IPsec Túnel       |

---

## 🔧 Fluxo Simplificado

[VPC AWS] ⇆ VGW ⇆ VPN ⇆ VNet Gateway ⇆ [VNET Azure]
(BGP ASN 65010) (BGP ASN 65020)

---

## 📜 Observações

- Ambas as pontas devem suportar BGP
- IPs públicos são usados como endpoints
- Use subnets dedicadas para gateway em ambos os lados

---

## ✅ Resultado Esperado

- Trânsito entre nuvens privado e seguro
- Sincronização de rotas via BGP

---
