output "data_loss_prevention_content_policies_id" {
  description = "Map of id values across all data_loss_prevention_content_policies, keyed the same as var.data_loss_prevention_content_policies except keys with no id are omitted"
  value       = { for k, v in google_data_loss_prevention_content_policy.data_loss_prevention_content_policies : k => v.id if v.id != null && length(v.id) > 0 }
}
output "data_loss_prevention_content_policies_create_time" {
  description = "Map of create_time values across all data_loss_prevention_content_policies, keyed the same as var.data_loss_prevention_content_policies except keys with no create_time are omitted"
  value       = { for k, v in google_data_loss_prevention_content_policy.data_loss_prevention_content_policies : k => v.create_time if v.create_time != null && length(v.create_time) > 0 }
}
output "data_loss_prevention_content_policies_default_action" {
  description = "Map of default_action values across all data_loss_prevention_content_policies, keyed the same as var.data_loss_prevention_content_policies except keys with no default_action are omitted"
  value       = { for k, v in google_data_loss_prevention_content_policy.data_loss_prevention_content_policies : k => one(v.default_action) if v.default_action != null && length(v.default_action) > 0 }
}
output "data_loss_prevention_content_policies_deletion_policy" {
  description = "Map of deletion_policy values across all data_loss_prevention_content_policies, keyed the same as var.data_loss_prevention_content_policies except keys with no deletion_policy are omitted"
  value       = { for k, v in google_data_loss_prevention_content_policy.data_loss_prevention_content_policies : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "data_loss_prevention_content_policies_display_name" {
  description = "Map of display_name values across all data_loss_prevention_content_policies, keyed the same as var.data_loss_prevention_content_policies except keys with no display_name are omitted"
  value       = { for k, v in google_data_loss_prevention_content_policy.data_loss_prevention_content_policies : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "data_loss_prevention_content_policies_errors" {
  description = "Map of errors values across all data_loss_prevention_content_policies, keyed the same as var.data_loss_prevention_content_policies except keys with no errors are omitted"
  value       = { for k, v in google_data_loss_prevention_content_policy.data_loss_prevention_content_policies : k => v.errors if v.errors != null && length(v.errors) > 0 }
}
output "data_loss_prevention_content_policies_failed_to_scan_supported_file_type" {
  description = "Map of failed_to_scan_supported_file_type values across all data_loss_prevention_content_policies, keyed the same as var.data_loss_prevention_content_policies except keys with no failed_to_scan_supported_file_type are omitted"
  value       = { for k, v in google_data_loss_prevention_content_policy.data_loss_prevention_content_policies : k => one(v.failed_to_scan_supported_file_type) if v.failed_to_scan_supported_file_type != null && length(v.failed_to_scan_supported_file_type) > 0 }
}
output "data_loss_prevention_content_policies_input_too_large" {
  description = "Map of input_too_large values across all data_loss_prevention_content_policies, keyed the same as var.data_loss_prevention_content_policies except keys with no input_too_large are omitted"
  value       = { for k, v in google_data_loss_prevention_content_policy.data_loss_prevention_content_policies : k => one(v.input_too_large) if v.input_too_large != null && length(v.input_too_large) > 0 }
}
output "data_loss_prevention_content_policies_inspect_config" {
  description = "Map of inspect_config values across all data_loss_prevention_content_policies, keyed the same as var.data_loss_prevention_content_policies except keys with no inspect_config are omitted"
  value       = { for k, v in google_data_loss_prevention_content_policy.data_loss_prevention_content_policies : k => one(v.inspect_config) if v.inspect_config != null && length(v.inspect_config) > 0 }
}
output "data_loss_prevention_content_policies_logging_configs" {
  description = "Map of logging_configs values across all data_loss_prevention_content_policies, keyed the same as var.data_loss_prevention_content_policies except keys with no logging_configs are omitted"
  value       = { for k, v in google_data_loss_prevention_content_policy.data_loss_prevention_content_policies : k => v.logging_configs if v.logging_configs != null && length(v.logging_configs) > 0 }
}
output "data_loss_prevention_content_policies_name" {
  description = "Map of name values across all data_loss_prevention_content_policies, keyed the same as var.data_loss_prevention_content_policies except keys with no name are omitted"
  value       = { for k, v in google_data_loss_prevention_content_policy.data_loss_prevention_content_policies : k => v.name if v.name != null && length(v.name) > 0 }
}
output "data_loss_prevention_content_policies_parent" {
  description = "Map of parent values across all data_loss_prevention_content_policies, keyed the same as var.data_loss_prevention_content_policies except keys with no parent are omitted"
  value       = { for k, v in google_data_loss_prevention_content_policy.data_loss_prevention_content_policies : k => v.parent if v.parent != null && length(v.parent) > 0 }
}
output "data_loss_prevention_content_policies_rules" {
  description = "Map of rules values across all data_loss_prevention_content_policies, keyed the same as var.data_loss_prevention_content_policies except keys with no rules are omitted"
  value       = { for k, v in google_data_loss_prevention_content_policy.data_loss_prevention_content_policies : k => v.rules if v.rules != null && length(v.rules) > 0 }
}
output "data_loss_prevention_content_policies_unsupported_file_type" {
  description = "Map of unsupported_file_type values across all data_loss_prevention_content_policies, keyed the same as var.data_loss_prevention_content_policies except keys with no unsupported_file_type are omitted"
  value       = { for k, v in google_data_loss_prevention_content_policy.data_loss_prevention_content_policies : k => one(v.unsupported_file_type) if v.unsupported_file_type != null && length(v.unsupported_file_type) > 0 }
}
output "data_loss_prevention_content_policies_update_time" {
  description = "Map of update_time values across all data_loss_prevention_content_policies, keyed the same as var.data_loss_prevention_content_policies except keys with no update_time are omitted"
  value       = { for k, v in google_data_loss_prevention_content_policy.data_loss_prevention_content_policies : k => v.update_time if v.update_time != null && length(v.update_time) > 0 }
}

