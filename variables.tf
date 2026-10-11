variable "express_route_circuit_peering_lookup" {
  description = <<EOT
Map of express_route_circuit_peering_lookup, attributes below
Required:
    - express_route_circuit_name
    - peering_type
    - resource_group_name
EOT

  type = map(object({
    express_route_circuit_name = string
    peering_type               = string
    resource_group_name        = string
  }))
  validation {
    condition = alltrue([
      for k, v in var.express_route_circuit_peering_lookup : (
        length(v.express_route_circuit_name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.express_route_circuit_peering_lookup : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.express_route_circuit_peering_lookup : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.express_route_circuit_peering_lookup : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

