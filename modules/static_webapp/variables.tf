variable "resource_group_name" {
  description = "Nom du groupe de ressources"
  type        = string
}

variable "location" {
    description = "Région Azure"
    type = string
    default = "West Europe"

}
