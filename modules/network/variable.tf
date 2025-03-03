variable "resource_group_name" {
  description = "Nom du groupe de ressources"
  type        = string
}

variable "location" {
  description = "Région Azure"
  type        = string
}

variable "vnet_name" {
  description = "Nom du réseau virtuel"
  type        = string
  default     = "vnet-app-db"
}

variable "vnet_address_space" {
  description = "Espace d'adressage du réseau virtuel"
  type        = string
  default     = "10.0.0.0/16"
}

variable "db_subnet_name" {
  description = "Nom du sous-réseau pour la base de données"
  type        = string
  default     = "subnet-db"
}

variable "db_subnet_address" {
  description = "Adresse du sous-réseau pour la base de données"
  type        = string
  default     = "10.0.1.0/24"
}

variable "webapp_subnet_name" {
  description = "Nom du sous-réseau pour l'application web"
  type        = string
  default     = "subnet-webapp"
}

variable "webapp_subnet_address" {
  description = "Adresse du sous-réseau pour l'application web"
  type        = string
  default     = "10.0.2.0/24"
}