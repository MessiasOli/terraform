resource "aws_vpc" "vpc_terraform" {
  cidr_block = "10.0.0.0/16"

  tags = {
    "Name" = "vpc-provider-terraform"
  }
}

resource "aws_vpc" "vpc_eua" {
  provider = aws.eua

  cidr_block = "10.0.0.0/16"

  tags = {
    "Name" = "vpc-provider-terraform"
  }
}