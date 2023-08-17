
terraform {
  required_version = "> 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.12.0"
    }
  }

  backend "s3" {
    bucket = "messias-remote-state"
    key    = "aws-vpc-provider/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "sa-east-1"
  default_tags {
    tags = {
      owner      = "messias"
      managed-by = "terraform"
      region     = "sa-east-1"
    }
  }
}

provider "aws" {
  alias  = "eua"
  region = "eu-central-1"
  default_tags {
    tags = {
      owner      = "messias"
      managed-by = "terraform"
      region     = "eu-central-1"
    }
  }
}