# 🔗 Terraform - AWS ↔ Azure VPN Site-to-Site

provider "aws" {
  region = "us-east-1"
}

provider "azurerm" {
  features {}
}

# AWS: Customer Gateway apontando para Azure
resource "aws_customer_gateway" "azure" {
  bgp_asn    = 65020
  ip_address = "AZURE_PUBLIC_IP"
  type       = "ipsec.1"
  tags = {
    Name = "Azure-CGW"
  }
}

resource "aws_vpn_gateway" "vgw" {
  vpc_id = "vpc-xxxxxxxx"
  tags = {
    Name = "AWS-VGW"
  }
}

resource "aws_vpn_connection" "aws_to_azure" {
  vpn_gateway_id      = aws_vpn_gateway.vgw.id
  customer_gateway_id = aws_customer_gateway.azure.id
  type                = "ipsec.1"
  static_routes_only  = false
  tags = {
    Name = "AWS-Azure-VPN"
  }
}

# Azure: VNet Gateway + Local Network Gateway + VPN Connection
resource "azurerm_virtual_network_gateway" "azure_vng" {
  name                = "vnet-gateway"
  location            = "East US"
  resource_group_name = "rg-networking-lab"
  type                = "Vpn"
  vpn_type            = "RouteBased"
  active_active       = false
  enable_bgp          = true
  sku                 = "VpnGw1"
  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = "azurerm_public_ip.azure_gw_ip.id"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = "azurerm_subnet.gateway_subnet.id"
  }
}

resource "azurerm_local_network_gateway" "aws_side" {
  name                = "aws-side"
  location            = "East US"
  resource_group_name = "rg-networking-lab"
  gateway_address     = "AWS_PUBLIC_IP"
  address_space       = ["10.0.0.0/8"]
  bgp_settings {
    asn     = 65010
    bgp_peering_address = "AWS_BGP_IP"
  }
}

resource "azurerm_virtual_network_gateway_connection" "azure_to_aws" {
  name                            = "azure-to-aws"
  location                        = "East US"
  resource_group_name             = "rg-networking-lab"
  virtual_network_gateway_id      = azurerm_virtual_network_gateway.azure_vng.id
  local_network_gateway_id        = azurerm_local_network_gateway.aws_side.id
  type                            = "IPsec"
  enable_bgp                      = true
  shared_key                      = "complex-vpn-shared-key"
}
