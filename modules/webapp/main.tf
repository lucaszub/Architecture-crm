# Déclaration du data source pour la configuration du client
data "azurerm_client_config" "current" {}

# Définir le groupe de ressources
resource "azurerm_resource_group" "tf" {
  name     = var.resource_group_name
  location = var.location
}

# Définir le plan de service
resource "azurerm_service_plan" "servicePlan" {
  name                = var.service_plan_name
  resource_group_name = azurerm_resource_group.tf.name
  location            = azurerm_resource_group.tf.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

# Définir le registre de conteneurs
resource "azurerm_container_registry" "acr" {
  name                = var.container_registry_name
  resource_group_name = azurerm_resource_group.tf.name
  location            = azurerm_resource_group.tf.location
  sku                 = "Basic"
  admin_enabled       = true
}

# Définir l'application web Linux avec identité système
resource "azurerm_linux_web_app" "webapp" {
  name                = var.webapp_name
  resource_group_name = azurerm_resource_group.tf.name
  location            = azurerm_resource_group.tf.location
  service_plan_id     = azurerm_service_plan.servicePlan.id

  identity {
    type = "SystemAssigned"
  }

  site_config {
    always_on = true

    application_stack {
      docker_image     = "${azurerm_container_registry.acr.login_server}/mon-image"
      docker_image_tag = "latest"
    }

    container_registry_use_managed_identity = true
  }

  app_settings = {
    "DOCKER_REGISTRY_SERVER_URL"          = "https://${azurerm_container_registry.acr.login_server}"
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "WEBSITES_PORT"                       = "8001"
  }

  depends_on = [
    azurerm_container_registry.acr,
    azurerm_service_plan.servicePlan
  ]
}

# Attribuer le rôle AcrPull à l'identité système de l'application web
resource "azurerm_role_assignment" "acr_pull_system" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_linux_web_app.webapp.identity[0].principal_id

  depends_on = [azurerm_linux_web_app.webapp, azurerm_container_registry.acr]
}
