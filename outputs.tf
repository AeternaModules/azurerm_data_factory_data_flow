output "data_factory_data_flows" {
  description = "All data_factory_data_flow resources"
  value       = azurerm_data_factory_data_flow.data_factory_data_flows
}
output "data_factory_data_flows_annotations" {
  description = "List of annotations values across all data_factory_data_flows"
  value       = [for k, v in azurerm_data_factory_data_flow.data_factory_data_flows : v.annotations]
}
output "data_factory_data_flows_data_factory_id" {
  description = "List of data_factory_id values across all data_factory_data_flows"
  value       = [for k, v in azurerm_data_factory_data_flow.data_factory_data_flows : v.data_factory_id]
}
output "data_factory_data_flows_description" {
  description = "List of description values across all data_factory_data_flows"
  value       = [for k, v in azurerm_data_factory_data_flow.data_factory_data_flows : v.description]
}
output "data_factory_data_flows_folder" {
  description = "List of folder values across all data_factory_data_flows"
  value       = [for k, v in azurerm_data_factory_data_flow.data_factory_data_flows : v.folder]
}
output "data_factory_data_flows_name" {
  description = "List of name values across all data_factory_data_flows"
  value       = [for k, v in azurerm_data_factory_data_flow.data_factory_data_flows : v.name]
}
output "data_factory_data_flows_script" {
  description = "List of script values across all data_factory_data_flows"
  value       = [for k, v in azurerm_data_factory_data_flow.data_factory_data_flows : v.script]
}
output "data_factory_data_flows_script_lines" {
  description = "List of script_lines values across all data_factory_data_flows"
  value       = [for k, v in azurerm_data_factory_data_flow.data_factory_data_flows : v.script_lines]
}
output "data_factory_data_flows_sink" {
  description = "List of sink values across all data_factory_data_flows"
  value       = [for k, v in azurerm_data_factory_data_flow.data_factory_data_flows : v.sink]
}
output "data_factory_data_flows_source" {
  description = "List of source values across all data_factory_data_flows"
  value       = [for k, v in azurerm_data_factory_data_flow.data_factory_data_flows : v.source]
}
output "data_factory_data_flows_transformation" {
  description = "List of transformation values across all data_factory_data_flows"
  value       = [for k, v in azurerm_data_factory_data_flow.data_factory_data_flows : v.transformation]
}

