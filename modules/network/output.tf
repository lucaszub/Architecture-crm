output "vnet_id" {
  description = "ID du réseau virtuel"
  value       = azurerm_virtual_network.vnet.id
}

output "db_subnet_id" {
  description = "ID du sous-réseau de la base de données"
  value       = azurerm_subnet.subnet_db.id
}

output "webapp_subnet_id" {
  description = "ID du sous-réseau de l'application web"
  value       = azurerm_subnet.subnet_webapp.id
}