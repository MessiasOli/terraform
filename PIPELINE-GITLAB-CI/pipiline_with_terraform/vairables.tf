variable "location" {
  description = "Variable that indicates the region where the will be created"
  type        = string
  default     = "Brazil South"
}

variable "aws_pub_key" {
  description = "Public key for VM on AWS"
  type = string
}

variable "azure_pub_key" {
  description = "Public key for VM on AZURE"
  type = string
}