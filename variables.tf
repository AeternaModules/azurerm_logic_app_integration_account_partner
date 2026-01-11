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
    business_identity = object({
      qualifier = string
      value     = string
    })
  }))
}

