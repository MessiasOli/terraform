resource "azurerm_resource_group" "resource-group" {
  name     = "vm"
  location = var.location
  tags     = local.commun_tags
}

resource "azurerm_public_ip" "public_ip" {
  name                = "public-ip-terraform"
  resource_group_name = azurerm_resource_group.resource-group.name
  location            = var.location
  allocation_method   = "Dynamic"

  tags = local.commun_tags
}

resource "azurerm_network_interface" "network_interface" {
  name                = "network_interface-terraform"
  location            = var.location
  resource_group_name = azurerm_resource_group.resource-group.name

  ip_configuration {
    name                          = "public-ip-terraform"
    subnet_id                     = data.terraform_remote_state.vnet.outputs.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }

  tags = local.commun_tags
}

resource "azurerm_network_interface_security_group_association" "nisga" {
  network_interface_id      = azurerm_network_interface.network_interface.id
  network_security_group_id = data.terraform_remote_state.vnet.outputs.security_group_id
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                  = "vm-terraform"
  resource_group_name   = azurerm_resource_group.resource-group.name
  location              = var.location
  size                  = "Standard_B1S"
  admin_username        = "terraform"
  network_interface_ids = [azurerm_network_interface.network_interface.id]

  admin_ssh_key {
    username   = "terraform"
    public_key = file("./azure-key.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip_address} >> public_ip.txt"
  }

  connection {
    type        = "ssh"
    user        = "terraform"
    private_key = file("./azure-key")
    host        = self.public_ip_address
  }

  provisioner "file" {
    content     = "public_ip: ${self.public_ip_address}"
    destination = "/tmp/public_ip.txt"
  }

  provisioner "file" {
    source      = "./test"
    destination = "/tmp"
  }

  provisioner "remote-exec" {
    inline = [
      "echo ami: ${var.location} >> /tmp/location.txt",
      "echo id_subnet: ${data.terraform_remote_state.vnet.outputs.subnet_id} >> /tmp/subnet_id.txt",
      "echo private_ip: ${self.private_ip_address} >> /tmp/private_ip.txt",
    ]
  }

  tags = local.commun_tags
}