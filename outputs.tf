output "logic_app_integration_account_partners_id" {
  description = "Map of id values across all logic_app_integration_account_partners, keyed the same as var.logic_app_integration_account_partners"
  value       = { for k, v in azurerm_logic_app_integration_account_partner.logic_app_integration_account_partners : k => v.id if v.id != null && length(v.id) > 0 }
}
output "logic_app_integration_account_partners_business_identity" {
  description = "Map of business_identity values across all logic_app_integration_account_partners, keyed the same as var.logic_app_integration_account_partners"
  value       = { for k, v in azurerm_logic_app_integration_account_partner.logic_app_integration_account_partners : k => v.business_identity if v.business_identity != null && length(v.business_identity) > 0 }
}
output "logic_app_integration_account_partners_integration_account_name" {
  description = "Map of integration_account_name values across all logic_app_integration_account_partners, keyed the same as var.logic_app_integration_account_partners"
  value       = { for k, v in azurerm_logic_app_integration_account_partner.logic_app_integration_account_partners : k => v.integration_account_name if v.integration_account_name != null && length(v.integration_account_name) > 0 }
}
output "logic_app_integration_account_partners_metadata" {
  description = "Map of metadata values across all logic_app_integration_account_partners, keyed the same as var.logic_app_integration_account_partners"
  value       = { for k, v in azurerm_logic_app_integration_account_partner.logic_app_integration_account_partners : k => v.metadata if v.metadata != null && length(v.metadata) > 0 }
}
output "logic_app_integration_account_partners_name" {
  description = "Map of name values across all logic_app_integration_account_partners, keyed the same as var.logic_app_integration_account_partners"
  value       = { for k, v in azurerm_logic_app_integration_account_partner.logic_app_integration_account_partners : k => v.name if v.name != null && length(v.name) > 0 }
}
output "logic_app_integration_account_partners_resource_group_name" {
  description = "Map of resource_group_name values across all logic_app_integration_account_partners, keyed the same as var.logic_app_integration_account_partners"
  value       = { for k, v in azurerm_logic_app_integration_account_partner.logic_app_integration_account_partners : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}

