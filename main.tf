module "network" {
  source                = "./modules/network"
  resource_group_name   = "az-tf-network"
  location              = "West Europe"
  vnet_name             = "vnet-app-lucas"
  vnet_address_space    = "10.0.0.0/16"
  db_subnet_name        = "subnet-db-lucas"
  db_subnet_address     = "10.0.1.0/24"
  webapp_subnet_name    = "subnet-webapp-lucas"
  webapp_subnet_address = "10.0.2.0/24"
}

module "webapp" {
  source                  = "./modules/webapp"
  resource_group_name     = "az-tf"
  location                = "West Europe"
  service_plan_name       = "sp-app-lucas"
  container_registry_name = "acrappcontainerlucas"
  webapp_name             = "webapp-container-lucas"
  subnet_db_id            = module.network.subnet_db_id
}

module "database" {
  source              = "./modules/database"
  resource_group_name = "az-tf-db"
  location            = "West Europe"
  sql_server_name     = "sqlserver-lucas"
  admin_username      = "lucaszub"
  admin_password      = "Medard44?"
  sql_database_name   = "sqldb-lucas"
  my_ip_address       = "88.140.191.20"
  db_subnet_id        = module.network.db_subnet_id
}


module "static_webapp" {
  source                = "./modules/static_webapp"
  resource_group_name   = "az-tf-front"
  location              = "West Europe"
  static_webapp_name    = "react-app"
}

