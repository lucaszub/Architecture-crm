variable "resource_group_name" {
  description = "Nom du groupe de ressources"
  type        = string
}

variable "location" {
  description = "Région Azure"
  type        = string
  default     = "West Europe"
}

variable "sql_server_name" {
  description = "Nom du serveur SQL"
  type        = string
}

variable "admin_username" {
  description = "Nom d'utilisateur administrateur"
  type        = string
}

variable "admin_password" {
  description = "Mot de passe administrateur"
  type        = string
  sensitive   = true
}

variable "sql_database_name" {
  description = "Nom de la base de données SQL"
  type        = string
}

variable "my_ip_address" {
  description = "Votre adresse IP publique pour accéder à la base de données"
  type        = string
}

variable "subnet_id" {
  description = "ID du sous-réseau pour la base de données"
  type        = string
  default     = ""
}
variable "db_subnet_id" {
  description = "ID du sous-réseau de la base de données"
  type        = string
}
