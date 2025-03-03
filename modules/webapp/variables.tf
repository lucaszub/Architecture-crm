variable "resource_group_name" {
  description = "Nom du groupe de ressources"
  type        = string
}

variable "location" {
  description = "Région Azure"
  type        = string
  default     = "West Europe"
}

variable "service_plan_name" {
  description = "Nom du plan de service"
  type        = string
}

variable "container_registry_name" {
  description = "Nom du registre de conteneurs"
  type        = string
}

variable "webapp_name" {
  description = "Nom de l'application web"
  type        = string
}
