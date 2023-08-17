variable "ports" {
  description = "Ports that will be opened on security group"
  type        = list(number)
  default     = [22, 80, 443, 8080]
}