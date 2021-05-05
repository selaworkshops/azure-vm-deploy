data "azurerm_public_ip" "public_ip" {
  name = var.STUDENT_NAME
  resource_group_name = azurerm_resource_group.myresourcegroup.name
  depends_on = [azurerm_linux_virtual_machine.myvm, azurerm_public_ip.publicip]
}
