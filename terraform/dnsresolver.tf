
resource "azurerm_resource_group" "rg_dns_resolver" {
  name     = "rg-xwc-dnsresolve-001"
  location = "Uk South"
  tags     = var.tags
}


resource "azurerm_private_dns_zone" "xcp_int_zone" {
  name                = "print.internal.xcp"
  resource_group_name = azurerm_resource_group.rg_dns_resolver.name
  tags                = var.tags
}

resource "azurerm_private_dns_txt_record" "offlineprint" {
  name                = "offlinemode"
  resource_group_name = azurerm_resource_group.rg_dns_resolver.name
  zone_name           = azurerm_private_dns_zone.xcp_int_zone.name
  ttl                 = 300

  record {
    value = var.value_txt_record
  }
}

resource "azurerm_private_dns_resolver" "pdnsresolver" {
  name                = "pdnsresolver"
  resource_group_name = azurerm_resource_group.rg_dns_resolver.name
  location            = azurerm_resource_group.rg_dns_resolver.location
  virtual_network_id  = data.azurerm_virtual_network.corevnet.id

}

resource "azurerm_private_dns_resolver_inbound_endpoint" "pdnsinendpoint" {
  name                    = "inbound-endpoint"
  private_dns_resolver_id = azurerm_private_dns_resolver.pdnsresolver.id
  location                = azurerm_private_dns_resolver.pdnsresolver.location
  ip_configurations {
    private_ip_allocation_method = "Dynamic"
    subnet_id                    = data.azurerm_subnet.dnsresolver_snet.id
  }

  tags = var.tags

}