output "public_ip_address" {
  description   = "The actual public ip address of the VM"
  value         = azurerm_public_ip.publicip.ip_address
}