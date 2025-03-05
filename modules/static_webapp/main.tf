# Définir le groupe de ressources
resource "azurerm_resource_group" "tf" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_static_site" "static_webapp" {
  name                = var.static_webapp_name
  resource_group_name = azurerm_resource_group.tf.name
  location            = azurerm_resource_group.tf.location
}
