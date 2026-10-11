data "azurerm_express_route_circuit_peering" "express_route_circuit_peering_lookup" {
  for_each = var.express_route_circuit_peering_lookup

  express_route_circuit_name = each.value.express_route_circuit_name
  peering_type               = each.value.peering_type
  resource_group_name        = each.value.resource_group_name
}

