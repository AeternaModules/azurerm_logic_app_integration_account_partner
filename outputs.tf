output "logic_app_integration_account_partners" {
  description = "All logic_app_integration_account_partner resources"
  value       = azurerm_logic_app_integration_account_partner.logic_app_integration_account_partners
}
output "logic_app_integration_account_partners_business_identity" {
  description = "List of business_identity values across all logic_app_integration_account_partners"
  value       = [for k, v in azurerm_logic_app_integration_account_partner.logic_app_integration_account_partners : v.business_identity]
}
output "logic_app_integration_account_partners_integration_account_name" {
  description = "List of integration_account_name values across all logic_app_integration_account_partners"
  value       = [for k, v in azurerm_logic_app_integration_account_partner.logic_app_integration_account_partners : v.integration_account_name]
}
output "logic_app_integration_account_partners_metadata" {
  description = "List of metadata values across all logic_app_integration_account_partners"
  value       = [for k, v in azurerm_logic_app_integration_account_partner.logic_app_integration_account_partners : v.metadata]
}
output "logic_app_integration_account_partners_name" {
  description = "List of name values across all logic_app_integration_account_partners"
  value       = [for k, v in azurerm_logic_app_integration_account_partner.logic_app_integration_account_partners : v.name]
}
output "logic_app_integration_account_partners_resource_group_name" {
  description = "List of resource_group_name values across all logic_app_integration_account_partners"
  value       = [for k, v in azurerm_logic_app_integration_account_partner.logic_app_integration_account_partners : v.resource_group_name]
}

