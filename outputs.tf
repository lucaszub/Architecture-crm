# Supprimez ou commentez les sorties qui posent problème
# output "vnet_name" {
#   description = "Nom du réseau virtuel"
#   value       = module.network.vnet_name
# }

output "vnet_id" {
  description = "ID du réseau virtuel"
  value       = module.network.vnet_id
}

output "db_subnet_id" {
  description = "ID du sous-réseau de la base de données"
  value       = module.network.db_subnet_id
}

output "webapp_subnet_id" {
  description = "ID du sous-réseau de l'application web"
  value       = module.network.webapp_subnet_id
}

# Supprimez ou commentez cette sortie car elle n'existe pas dans le module database
# output "sql_server_fqdn" {
#   description = "Nom de domaine complet du serveur SQL"
#   value       = module.database.sql_server_fqdn
# }