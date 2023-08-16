resource "aws_vpc" "vpc_terraform" {
  cidr_block = var.cidr_vpc

  tags = {
    "Name" = "vpc-${var.enviroment}"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.vpc_terraform.id
  cidr_block = var.cidr_subnet

  tags = {
    Name = "subnet-${var.enviroment}"
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc_terraform.id

  tags = {
    Name = "Internet-gateway-${var.enviroment}"
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc_terraform.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "route-table-${var.enviroment}"
  }
}

resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_security_group" "security_group" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.vpc_terraform.id

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}