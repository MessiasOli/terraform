resource "aws_key_pair" "key" {
  key_name   = "aws_key"
  public_key = file("./aws-key.pub")
}

resource "aws_instance" "vm" {
  ami                         = "ami-0f47fe3e9defb4cbf"
  instance_type               = "c6a.2xlarge"
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.subnet_id
  vpc_security_group_ids      = [data.terraform_remote_state.vpc.outputs.security_group_id]
  associate_public_ip_address = true

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> public_ip.txt"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("./aws-key")
    host        = self.public_ip
  }

  provisioner "file" {
    content     = "public_ip: ${self.public_ip}"
    destination = "/tmp/public_ip.txt"
  }

  provisioner "file" {
    source      = "./test.txt"
    destination = "/tmp/exemple.txt"
  }

  provisioner "remote-exec" {
    inline = [
      "echo ami: ${self.ami} >> /tmp/ami.txt",
      "echo private_ip: ${self.private_ip} >> /tmp/private_ip.txt",
    ]
  }

  tags = {
    Name = "vm-terraform"
  }
}