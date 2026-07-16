output "data_factory_data_flows_id" {
  description = "Map of id values across all data_factory_data_flows, keyed the same as var.data_factory_data_flows"
  value       = { for k, v in azurerm_data_factory_data_flow.data_factory_data_flows : k => v.id if v.id != null && length(v.id) > 0 }
}
output "data_factory_data_flows_annotations" {
  description = "Map of annotations values across all data_factory_data_flows, keyed the same as var.data_factory_data_flows"
  value       = { for k, v in azurerm_data_factory_data_flow.data_factory_data_flows : k => v.annotations if v.annotations != null && length(v.annotations) > 0 }
}
output "data_factory_data_flows_data_factory_id" {
  description = "Map of data_factory_id values across all data_factory_data_flows, keyed the same as var.data_factory_data_flows"
  value       = { for k, v in azurerm_data_factory_data_flow.data_factory_data_flows : k => v.data_factory_id if v.data_factory_id != null && length(v.data_factory_id) > 0 }
}
output "data_factory_data_flows_description" {
  description = "Map of description values across all data_factory_data_flows, keyed the same as var.data_factory_data_flows"
  value       = { for k, v in azurerm_data_factory_data_flow.data_factory_data_flows : k => v.description if v.description != null && length(v.description) > 0 }
}
output "data_factory_data_flows_folder" {
  description = "Map of folder values across all data_factory_data_flows, keyed the same as var.data_factory_data_flows"
  value       = { for k, v in azurerm_data_factory_data_flow.data_factory_data_flows : k => v.folder if v.folder != null && length(v.folder) > 0 }
}
output "data_factory_data_flows_name" {
  description = "Map of name values across all data_factory_data_flows, keyed the same as var.data_factory_data_flows"
  value       = { for k, v in azurerm_data_factory_data_flow.data_factory_data_flows : k => v.name if v.name != null && length(v.name) > 0 }
}
output "data_factory_data_flows_script" {
  description = "Map of script values across all data_factory_data_flows, keyed the same as var.data_factory_data_flows"
  value       = { for k, v in azurerm_data_factory_data_flow.data_factory_data_flows : k => v.script if v.script != null && length(v.script) > 0 }
}
output "data_factory_data_flows_script_lines" {
  description = "Map of script_lines values across all data_factory_data_flows, keyed the same as var.data_factory_data_flows"
  value       = { for k, v in azurerm_data_factory_data_flow.data_factory_data_flows : k => v.script_lines if v.script_lines != null && length(v.script_lines) > 0 }
}
output "data_factory_data_flows_sink" {
  description = "Map of sink values across all data_factory_data_flows, keyed the same as var.data_factory_data_flows"
  value       = { for k, v in azurerm_data_factory_data_flow.data_factory_data_flows : k => v.sink if v.sink != null && length(v.sink) > 0 }
}
output "data_factory_data_flows_source" {
  description = "Map of source values across all data_factory_data_flows, keyed the same as var.data_factory_data_flows"
  value       = { for k, v in azurerm_data_factory_data_flow.data_factory_data_flows : k => v.source if v.source != null && length(v.source) > 0 }
}
output "data_factory_data_flows_transformation" {
  description = "Map of transformation values across all data_factory_data_flows, keyed the same as var.data_factory_data_flows"
  value       = { for k, v in azurerm_data_factory_data_flow.data_factory_data_flows : k => v.transformation if v.transformation != null && length(v.transformation) > 0 }
}

