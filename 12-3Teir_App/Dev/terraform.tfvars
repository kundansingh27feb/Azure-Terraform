rg_details = {
  rg1 = {
    name     = "3-teir-arch-dev"
    location = "westus"
  }
}

sa_details = {
  devgurukulsikshasa = {
    resource_group_name      = "3-teir-arch-dev"
    location                 = "westus"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
}

vnet = {
  vnet1 = {
    name                = "3-teir-vnet"
    address_space       = "10.0.0.0/16"
    location            = "westus"
    resource_group_name = "3-teir-arch-dev"
  }
}

subnet1 = {
  sub1 = {
    name                 = "frontendSubnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
  sub2 = {
    name                 = "backendSubnet"
    address_prefixes     = ["10.0.2.0/24"]
  }
}

vm_config = {
  frontend = {
    name                  = "frontendVM"
    location              = "westus"
    resource_group_name   = "3-teir-arch-dev"
    network_interface_ids = ""
    vm_size               = "Standard_B1s"
    os_disk = {
      name              = "frontOSDisk"
      caching           = "ReadWrite"
      create_option     = "FromImage"
      managed_disk_type = "Standard_LRS"
    }
    image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-focal"
      sku       = "20_04-lts"
      version   = "latest"
    }
    admin_credentials = {
      username = "kundans"
      password = "password123!"
    }
    disable_password_authentication = false
    tags = {
      environment = "dev"
    }
  }
  backend = {
    name                  = "backendVM"
    location              = "westus"
    resource_group_name   = "3-teir-arch-dev"
    network_interface_ids = ""
    vm_size               = "Standard_B1s"
    os_disk = {
      name              = "backendOSDisk"
      caching           = "ReadWrite"
      create_option     = "FromImage"
      managed_disk_type = "Standard_LRS"
    }
    image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-focal"
      sku       = "20_04-lts"
      version   = "latest"
    }
    admin_credentials = {
      username = "kundans"
      password = "password123!"
    }
    disable_password_authentication = false
    tags = {
      environment = "dev"
    }
  }
}

public_ip = {
  pub_ip1 = {
    name                = "pub_ip1"
    location            = "westus"
    resource_group_name = "3-teir-arch-dev"
    allocation_method   = "Dynamic"
  }
  pub_ip2 = {
    name                = "pub_ip2"
    location            = "westus"
    resource_group_name = "3-teir-arch-dev"
    allocation_method   = "Dynamic"
  }
}

network_interfaces = {
  network_interface_1 = {
    name                = "network_interface_1"
    location            = "westus"
    resource_group_name = "3-teir-arch-dev"
    subnet_id           = "sub1"
    public_ip_id        = "pub_ip1"
    network_security_group_id   = ""
  }
  network_interface_2 = {
    name                = "network_interface_2"
    location            = "westus"
    resource_group_name = "3-teir-arch-dev"
    subnet_id           = "sub2"
    public_ip_id        = "pub_ip2"
    network_security_group_id   = ""
  }
}

nsg = {
  nsg1 = {
    name                = "frontend-nsg1"
    location            = "westus"
    resource_group_name = "3-teir-arch-dev"
    security_rules = [
      {
        name                       = "allow_ssh"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "allow_http"
        priority                   = 1002
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
  nsg2 = {
    name                = "backend-nsg2"
    location            = "westus"
    resource_group_name = "3-teir-arch-dev"
    security_rules = [
      {
        name                       = "allow_ssh"
        priority                   = 1004
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "allow_rdp"
        priority                   = 1005
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "8000"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
}