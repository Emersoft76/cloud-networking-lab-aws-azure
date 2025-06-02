# 🧱 Terraform - AWS TGW + DXGW

provider "aws" {
  region = "us-east-1"
}

# Transit Gateway
resource "aws_ec2_transit_gateway" "main" {
  description = "Main TGW for inter-VPC routing"
  auto_accept_shared_attachments = "enable"
  default_route_table_association = "enable"
  default_route_table_propagation = "enable"
}

# VPC Attachment (exemplo para 1 VPC)
resource "aws_ec2_transit_gateway_vpc_attachment" "vpc1" {
  subnet_ids         = ["subnet-xxxxxxxx"]
  transit_gateway_id = aws_ec2_transit_gateway.main.id
  vpc_id             = "vpc-xxxxxxxx"
  tags = {
    Name = "TGW-VPC1-Attachment"
  }
}

# Direct Connect Gateway (mock - sem DX físico neste exemplo)
resource "aws_dx_gateway" "main" {
  name            = "dxgw-lab"
  amazon_side_asn = 64512
}

resource "aws_dx_gateway_association" "assoc" {
  dx_gateway_id         = aws_dx_gateway.main.id
  associated_gateway_id = aws_ec2_transit_gateway.main.id
  allowed_prefixes      = ["10.0.0.0/8"]
}
