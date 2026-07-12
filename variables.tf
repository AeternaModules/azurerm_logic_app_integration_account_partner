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
  # --- Unconfirmed validation candidates, derived from azurerm_logic_app_integration_account_partner's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.IntegrationAccountPartnerName] !ok
  # path: name
  #   condition: length(value) <= 80
  #   message:   [from validate.IntegrationAccountPartnerName: invalid when len(value) > 80]
  #   source:    [from validate.IntegrationAccountPartnerName: invalid when len(value) > 80]
  # path: name
  #   source:    [from validate.IntegrationAccountPartnerName] !regexp.MustCompile(`^[A-Za-z0-9-().]+$`).MatchString(v)
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: integration_account_name
  #   source:    validate.IntegrationAccountName: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: business_identity.qualifier
  #   source:    [from validate.IntegrationAccountPartnerBusinessIdentityQualifier] !ok
  # path: business_identity.qualifier
  #   source:    [from validate.IntegrationAccountPartnerBusinessIdentityQualifier] !regexp.MustCompile(`^[A-Za-z0-9]+$`).MatchString(v)
  # path: business_identity.value
  #   source:    [from validate.IntegrationAccountPartnerBusinessIdentityValue] !ok
  # path: business_identity.value
  #   condition: length(value) <= 128
  #   message:   [from validate.IntegrationAccountPartnerBusinessIdentityValue: invalid when len(value) > 128]
  #   source:    [from validate.IntegrationAccountPartnerBusinessIdentityValue: invalid when len(value) > 128]
  # path: business_identity.value
  #   source:    [from validate.IntegrationAccountPartnerBusinessIdentityValue] !regexp.MustCompile(`^[A-Za-z0-9-() ._]+$`).MatchString(v)
  # path: metadata
  #   source:    validation.StringIsJSON(...) - no translation rule yet, add one
}

