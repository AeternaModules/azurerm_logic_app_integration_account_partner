variable "logic_app_integration_account_partners" {
  description = <<EOT
Map of logic_app_integration_account_partners, attributes below
Required:
    - integration_account_name
    - name
    - resource_group_name
    - business_identity (block):
        - qualifier (required)
        - value (required)
Optional:
    - metadata
EOT

  type = map(object({
    integration_account_name = string
    name                     = string
    resource_group_name      = string
    metadata                 = optional(string)
    business_identity = list(object({
      qualifier = string
      value     = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.logic_app_integration_account_partners : (
        length(v.business_identity) >= 1
      )
    ])
    error_message = "Each business_identity list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.logic_app_integration_account_partners : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.logic_app_integration_account_partners : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.logic_app_integration_account_partners : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.logic_app_integration_account_partners : (
        v.metadata == null || (can(jsondecode(v.metadata)))
      )
    ])
    error_message = "must be valid JSON"
  }
  # Note: 10 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

