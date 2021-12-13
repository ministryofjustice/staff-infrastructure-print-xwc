resource "random_password" "password" {
  length           = 24
  min_lower        = 1
  min_numeric      = 1
  min_upper        = 1
  min_special      = 1
  override_special = "!$%"

}


resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sql_server_administrator
  administrator_login_password = random_password.password.result
  minimum_tls_version          = 1.2
  azuread_administrator {
    login_username = var.sqldb_azuread_administrator.username
    object_id      = var.sqldb_azuread_administrator.object_id
  }
  tags = var.tags
}

resource "azurerm_mssql_elasticpool" "elastic_pool" {
  name                = var.elastic_pool_name
  resource_group_name = var.resource_group_name
  location            = var.location
  server_name         = azurerm_mssql_server.sql_server.name
  license_type        = "LicenseIncluded"
  max_size_gb         = 50

  sku {
    name     = "StandardPool"
    tier     = "Standard"
    capacity = 50
  }

  per_database_settings {
    min_capacity = 10
    max_capacity = 20
  }
  tags = var.tags

  lifecycle {
    ignore_changes = [license_type] # For some reason this keeps popping up as a change even though it's the same value
  }
}

resource "azurerm_mssql_database" "databases" {
  for_each        = toset(var.db_names)
  name            = each.value
  server_id       = azurerm_mssql_server.sql_server.id
  sku_name        = "ElasticPool"
  elastic_pool_id = azurerm_mssql_elasticpool.elastic_pool.id
  tags            = var.tags
}

resource "azurerm_key_vault_secret" "username" {
  name         = "sql-server-administrator-username"
  value        = var.sql_server_administrator
  key_vault_id = data.azurerm_key_vault.key_vault.id
}

resource "azurerm_key_vault_secret" "password" {
  name         = "sql-server-administrator-password"
  value        = random_password.password.result
  key_vault_id = data.azurerm_key_vault.key_vault.id
}

#Note that although we are using two subnets because there is default east-west routing in the vnet, we only need a single PE
resource "azurerm_private_endpoint" "sql_private_endpoint" {
  name                = "pe-sql-${var.sql_server_name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = data.azurerm_subnet.subnet[var.private_link_subnet].id
  tags                = var.tags
  private_service_connection {
    name                           = "connection-${var.sql_server_name}"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_mssql_server.sql_server.id
    subresource_names              = ["sqlServer"]
  }

}

resource "azurerm_private_dns_zone" "dns_zone" {
  name                = "privatelink.database.windows.net"
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "private_dns_vnet_link" {
  name                  = data.azurerm_virtual_network.vnet.name
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.dns_zone.name
  virtual_network_id    = data.azurerm_virtual_network.vnet.id
  tags                  = var.tags
}

resource "azurerm_private_dns_a_record" "dns_zone" {
  name                = var.sql_server_name
  zone_name           = azurerm_private_dns_zone.dns_zone.name
  resource_group_name = var.resource_group_name
  ttl                 = 300
  records             = azurerm_private_endpoint.sql_private_endpoint.custom_dns_configs[0].ip_addresses
  tags                = var.tags
}