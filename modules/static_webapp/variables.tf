variable "resource_group_name" {
  description = "Nom du groupe de ressources"
  type        = string
}

variable "location" {
    description = "Région Azure"
    type = string
    default = "West Europe"

}
variable "static_webapp_name" {
  description = "Nom de l'application web"
  type        = string
}
