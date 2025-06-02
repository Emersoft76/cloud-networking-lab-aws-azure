# ☁️ Azure Virtual WAN com ExpressRoute e Global Peering

Este cenário configura uma topologia de backbone usando Virtual WAN da Azure com conexões ExpressRoute e Peering entre hubs.

---

## 🎯 Objetivo

- Interligar sites regionais com ExpressRoute
- Conectar VNETs via Virtual WAN Hubs
- Configurar peering global entre regiões

---

## 🛠️ Componentes

| Componente           | Função                                           |
|----------------------|--------------------------------------------------|
| Virtual WAN          | Backbone de rede Azure                           |
| ExpressRoute         | Link dedicado com on-premises                    |
| VNET A (região 1)    | Aplicações                                       |
| VNET B (região 2)    | Aplicações                                       |
| Hub Virtual WAN      | Gerencia conexões e roteamento                   |

---

## 🔁 Fluxo

[On-Prem] <== ExpressRoute ==> [Hub1] == Peering ==> [Hub2] <==> [VNETs]

---

## 🔧 Azure CLI (Criação do WAN Hub)

```bash
az network vwan create \
  --name core-vwan \
  --resource-group rg-network \
  --location eastus

az network vhub create \
  --name eastus-hub \
  --resource-group rg-network \
  --vwan core-vwan \
  --address-prefix 10.1.0.0/16 \
  --location eastus
```

---

## ✅ Resultado Esperado

- Alta disponibilidade e latência mínima

- Controle centralizado via WAN Hub

- Redundância com ExpressRoute e Peering

---
