data "azurerm_virtual_network" "corevnet" {
  name                = "vnet-xwc-core-001"
  resource_group_name = "rg-xwc-core-001"
}

data "azurerm_subnet" "dnsresolver_snet" {
  name                 = "snet-xwc-dnsresolve"
  virtual_network_name = "vnet-xwc-core-001"
  resource_group_name  = "rg-xwc-core-001"
}