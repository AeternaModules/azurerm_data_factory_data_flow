output "data_factory_data_flows_id" {
  description = "Map of id values across all data_factory_data_flows, keyed the same as var.data_factory_data_flows"
  value       = { for k, v in azurerm_data_factory_data_flow.data_factory_data_flows : k => v.id }
}
output "data_factory_data_flows_annotations" {
  description = "Map of annotations values across all data_factory_data_flows, keyed the same as var.data_factory_data_flows"
  value       = { for k, v in azurerm_data_factory_data_flow.data_factory_data_flows : k => v.annotations }
}
output "data_factory_data_flows_data_factory_id" {
  description = "Map of data_factory_id values across all data_factory_data_flows, keyed the same as var.data_factory_data_flows"
  value       = { for k, v in azurerm_data_factory_data_flow.data_factory_data_flows : k => v.data_factory_id }
}
output "data_factory_data_flows_description" {
  description = "Map of description values across all data_factory_data_flows, keyed the same as var.data_factory_data_flows"
  value       = { for k, v in azurerm_data_factory_data_flow.data_factory_data_flows : k => v.description }
}
output "data_factory_data_flows_folder" {
  description = "Map of folder values across all data_factory_data_flows, keyed the same as var.data_factory_data_flows"
  value       = { for k, v in azurerm_data_factory_data_flow.data_factory_data_flows : k => v.folder }
}
output "data_factory_data_flows_name" {
  description = "Map of name values across all data_factory_data_flows, keyed the same as var.data_factory_data_flows"
  value       = { for k, v in azurerm_data_factory_data_flow.data_factory_data_flows : k => v.name }
}
output "data_factory_data_flows_script" {
  description = "Map of script values across all data_factory_data_flows, keyed the same as var.data_factory_data_flows"
  value       = { for k, v in azurerm_data_factory_data_flow.data_factory_data_flows : k => v.script }
}
output "data_factory_data_flows_script_lines" {
  description = "Map of script_lines values across all data_factory_data_flows, keyed the same as var.data_factory_data_flows"
  value       = { for k, v in azurerm_data_factory_data_flow.data_factory_data_flows : k => v.script_lines }
}
output "data_factory_data_flows_sink" {
  description = "Map of sink values across all data_factory_data_flows, keyed the same as var.data_factory_data_flows"
  value       = { for k, v in azurerm_data_factory_data_flow.data_factory_data_flows : k => v.sink }
}
output "data_factory_data_flows_source" {
  description = "Map of source values across all data_factory_data_flows, keyed the same as var.data_factory_data_flows"
  value       = { for k, v in azurerm_data_factory_data_flow.data_factory_data_flows : k => v.source }
}
output "data_factory_data_flows_transformation" {
  description = "Map of transformation values across all data_factory_data_flows, keyed the same as var.data_factory_data_flows"
  value       = { for k, v in azurerm_data_factory_data_flow.data_factory_data_flows : k => v.transformation }
}

