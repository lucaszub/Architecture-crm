
# Définir le groupe de ressources
resource "azurerm_resource_group" "tf" {
  name     = var.resource_group_name
  location = var.location
}