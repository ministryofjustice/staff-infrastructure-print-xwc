locals {
  #TODO: Make this less  hacky
  load_balancers = { for v in var.vm_details : v.load_balancer.name => v... }

}

resource "azurerm_lb" "load_balancer" {
  for_each            = local.load_balancers
  name                = each.key
  location            = var.location
  resource_group_name = var.app_resource_group_name
  sku                 = "Standard"

  #TODO: Make this less  hacky
  frontend_ip_configuration {
    name                          = "fe-${each.key}"
    subnet_id                     = data.azurerm_subnet.subnet[each.value[0].nic.subnet].id
    private_ip_address            = each.value[0].load_balancer.ip_address
    private_ip_address_allocation = "Static"
  }

  tags = var.tags
}

resource "azurerm_lb_probe" "health_probe" {
  for_each            = local.load_balancers
  resource_group_name = var.app_resource_group_name
  loadbalancer_id     = azurerm_lb.load_balancer[each.key].id
  name                = "rule-${var.load_balancer_rule_port}-${each.key}"
  port                = var.load_balancer_rule_port
}

resource "azurerm_lb_rule" "loadbalancing_rule" {
  for_each                       = local.load_balancers
  resource_group_name            = var.app_resource_group_name
  loadbalancer_id                = azurerm_lb.load_balancer[each.key].id
  name                           = "rule-${var.load_balancer_rule_port}-${each.key}"
  protocol                       = "Tcp"
  frontend_port                  = var.load_balancer_rule_port
  backend_port                   = var.load_balancer_rule_port
  frontend_ip_configuration_name = "fe-${each.key}"
  probe_id                       = azurerm_lb_probe.health_probe[each.key].id
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backend_pool[each.key].id]
  load_distribution              = "SourceIPProtocol"
}


resource "azurerm_lb_backend_address_pool" "backend_pool" {
  for_each        = local.load_balancers
  loadbalancer_id = azurerm_lb.load_balancer[each.key].id
  name            = "be-${each.key}"
}

resource "azurerm_lb_backend_address_pool_address" "backend_pool_ip" {
  for_each                = var.vm_details
  name                    = "be-pool-ip-${each.key}"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool[each.value.load_balancer.name].id
  virtual_network_id      = data.azurerm_virtual_network.vnet.id
  ip_address              = each.value.nic.ip_address
}
