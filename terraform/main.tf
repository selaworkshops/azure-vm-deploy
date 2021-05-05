# Create a resource group
resource "azurerm_resource_group" "myresourcegroup" {
  name     = var.STUDENT_NAME
  location = var.AZURE_LOCATION
}

# Create a virtual network for the virtual machine
resource "azurerm_virtual_network" "myvnet" {
  name                = var.STUDENT_NAME
  address_space       = [ var.VNET_ADDRESS_SPACE ]
  location            = azurerm_resource_group.myresourcegroup.location
  resource_group_name = azurerm_resource_group.myresourcegroup.name
}

# Create a subnet for the virtual machine
resource "azurerm_subnet" "mysubnet" {
  name                 = "default"
  resource_group_name  = azurerm_resource_group.myresourcegroup.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = [ var.SUBNET_ADDRESS_PREFIX ]
}

# Create a public ip for the VM
resource "azurerm_public_ip" "publicip" {
    name                         = var.STUDENT_NAME
    location                     = azurerm_resource_group.myresourcegroup.location
    resource_group_name          = azurerm_resource_group.myresourcegroup.name
    allocation_method            = "Dynamic"
}

# Create the network interface for the virtual machine
resource "azurerm_network_interface" "mynic" {
  name                = var.STUDENT_NAME
  location            = azurerm_resource_group.myresourcegroup.location
  resource_group_name = azurerm_resource_group.myresourcegroup.name

  ip_configuration {
    name                          = "default"
    subnet_id                     = azurerm_subnet.mysubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip.id
  }
}

# Create a virtual machine (Linux)
resource "azurerm_linux_virtual_machine" "myvm" {
  name                = var.STUDENT_NAME
  resource_group_name = azurerm_resource_group.myresourcegroup.name
  location            = azurerm_resource_group.myresourcegroup.location
  size                = "Standard_B2s"
  admin_username      = "azureuser"
  network_interface_ids = [
    azurerm_network_interface.mynic.id,
  ]

  disable_password_authentication = false
  admin_password                  = var.VM_ADMIN_PASSWORD

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}