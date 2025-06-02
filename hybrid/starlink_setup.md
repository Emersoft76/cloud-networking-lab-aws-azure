# 🛰️ Starlink + AWS/Azure – Conectividade em Ambientes Remotos

Este cenário explora como integrar a conectividade Starlink em ambientes com infraestrutura híbrida em nuvem, usando IPsec e WireGuard para conexão segura.

---

## 🎯 Objetivo

- Habilitar conectividade cloud em áreas sem fibra
- Estabelecer VPN para AWS ou Azure
- Monitorar e otimizar latência Starlink

---

## 📦 Requisitos

- Terminal Starlink ativo
- Roteador com IP público ou 1:1 NAT
- Cliente WireGuard ou StrongSwan
- AWS Site-to-Site VPN ou Azure VPN Gateway

---

## 🔁 Fluxo

[Local Host ↔ Starlink] → VPN → Cloud Gateway → VPC/VNET

---

## 🛠️ WireGuard Client (Linux)

```bash
sudo apt install wireguard
wg genkey | tee privatekey | wg pubkey > publickey
```
Configure /etc/wireguard/wg0.conf com:
```ini
[Interface]
PrivateKey = <key>
Address = 10.100.100.2/24

[Peer]
PublicKey = <cloud-key>
Endpoint = <cloud-ip>:51820
AllowedIPs = 0.0.0.0/0
PersistentKeepalive = 25
```

---

## ✅ Resultado Esperado

- Tunelamento VPN funcional sobre Starlink

- Conectividade cloud estável em áreas remotas

- Possibilidade de failover com redes LTE/4G

---
