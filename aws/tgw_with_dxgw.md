# 🌐 AWS Transit Gateway com Direct Connect Gateway

Este cenário demonstra como conectar múltiplas VPCs em diferentes regiões com roteamento centralizado via Transit Gateway (TGW) e Direct Connect Gateway (DXGW).

---

## 🎯 Objetivo

- Conectar VPCs em múltiplas regiões
- Usar TGW para roteamento centralizado
- Estender conectividade com DX para on-premises

---

## 🛠️ Componentes Utilizados

| Componente          | Função                                          |
|---------------------|-------------------------------------------------|
| VPC A (região 1)    | Aplicação #1                                    |
| VPC B (região 2)    | Aplicação #2                                    |
| TGW                 | Roteamento entre VPCs                           |
| DXGW                | Conexão com Direct Connect                      |
| DX                  | Link físico com on-premises                     |
| Route Tables (TGW)  | Definição de rotas entre VPCs e DXGW            |

---

## 🧭 Diagrama

[On-Prem] <--DX--> [DXGW] <--assoc--> [TGW] <--attach--> [VPC-A] + [VPC-B]

---

## ⚙️ Passos Gerais

1. Criar TGW em us-east-1
2. Criar DXGW
3. Associar TGW à DXGW
4. Anexar VPCs ao TGW
5. Atualizar rotas nas route tables das VPCs
6. Validar conectividade entre VPCs e on-prem

---

## 🧾 Terraform Exemplo (TGW + DXGW)

```hcl
resource "aws_ec2_transit_gateway" "core" {
  description = "Core TGW for inter-region routing"
  auto_accept_shared_attachments = "enable"
}

resource "aws_dx_gateway" "main" {
  name = "core-dxgw"
  amazon_side_asn = 64512
}

resource "aws_dx_gateway_association" "tgw_link" {
  dx_gateway_id         = aws_dx_gateway.main.id
  associated_gateway_id = aws_ec2_transit_gateway.core.id
  allowed_prefixes      = ["10.0.0.0/8"]
}
```

---

## ✅ Resultado Esperado

- Comunicação privada entre VPCs e on-premises via DX
- Baixa latência, sem passagem pela internet

---
