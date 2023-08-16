variable "cidr_vpc" {
  description = "Cidr block for vpc"
  type        = string
}

variable "cidr_subnet" {
  description = "Cidr block for subnet"
  type        = string
}

variable "enviroment" {
  description = "Environment where the resource will be used"
  type        = string
}