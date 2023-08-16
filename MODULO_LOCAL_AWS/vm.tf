resource "aws_key_pair" "key" {
  key_name   = "aws_key"
  public_key = file("./aws-key.pub")
}

resource "aws_instance" "vm" {
  ami                         = "ami-0f47fe3e9defb4cbf"
  instance_type               = "c6a.2xlarge"
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = module.network.subnet_id
  vpc_security_group_ids      = [module.network.security_group_id]
  associate_public_ip_address = true

  tags = {
    Name = "vm-terraform"
  }
}