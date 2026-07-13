variable "data_factory_data_flows" {
  description = <<EOT
Map of data_factory_data_flows, attributes below
Required:
    - data_factory_id
    - name
    - sink (block):
        - dataset (optional, block):
            - name (required)
            - parameters (optional)
        - description (optional)
        - flowlet (optional, block):
            - dataset_parameters (optional)
            - name (required)
            - parameters (optional)
        - linked_service (optional, block):
            - name (required)
            - parameters (optional)
        - name (required)
        - rejected_linked_service (optional, block):
            - name (required)
            - parameters (optional)
        - schema_linked_service (optional, block):
            - name (required)
            - parameters (optional)
    - source (block):
        - dataset (optional, block):
            - name (required)
            - parameters (optional)
        - description (optional)
        - flowlet (optional, block):
            - dataset_parameters (optional)
            - name (required)
            - parameters (optional)
        - linked_service (optional, block):
            - name (required)
            - parameters (optional)
        - name (required)
        - rejected_linked_service (optional, block):
            - name (required)
            - parameters (optional)
        - schema_linked_service (optional, block):
            - name (required)
            - parameters (optional)
Optional:
    - annotations
    - description
    - folder
    - script
    - script_lines
    - transformation (block):
        - dataset (optional, block):
            - name (required)
            - parameters (optional)
        - description (optional)
        - flowlet (optional, block):
            - dataset_parameters (optional)
            - name (required)
            - parameters (optional)
        - linked_service (optional, block):
            - name (required)
            - parameters (optional)
        - name (required)
EOT

  type = map(object({
    data_factory_id = string
    name            = string
    annotations     = optional(list(string))
    description     = optional(string)
    folder          = optional(string)
    script          = optional(string)
    script_lines    = optional(list(string))
    sink = list(object({
      dataset = optional(object({
        name       = string
        parameters = optional(map(string))
      }))
      description = optional(string)
      flowlet = optional(object({
        dataset_parameters = optional(string)
        name               = string
        parameters         = optional(map(string))
      }))
      linked_service = optional(object({
        name       = string
        parameters = optional(map(string))
      }))
      name = string
      rejected_linked_service = optional(object({
        name       = string
        parameters = optional(map(string))
      }))
      schema_linked_service = optional(object({
        name       = string
        parameters = optional(map(string))
      }))
    }))
    source = list(object({
      dataset = optional(object({
        name       = string
        parameters = optional(map(string))
      }))
      description = optional(string)
      flowlet = optional(object({
        dataset_parameters = optional(string)
        name               = string
        parameters         = optional(map(string))
      }))
      linked_service = optional(object({
        name       = string
        parameters = optional(map(string))
      }))
      name = string
      rejected_linked_service = optional(object({
        name       = string
        parameters = optional(map(string))
      }))
      schema_linked_service = optional(object({
        name       = string
        parameters = optional(map(string))
      }))
    }))
    transformation = optional(list(object({
      dataset = optional(object({
        name       = string
        parameters = optional(map(string))
      }))
      description = optional(string)
      flowlet = optional(object({
        dataset_parameters = optional(string)
        name               = string
        parameters         = optional(map(string))
      }))
      linked_service = optional(object({
        name       = string
        parameters = optional(map(string))
      }))
      name = string
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.data_factory_data_flows : (
        length(v.sink) >= 1
      )
    ])
    error_message = "Each sink list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_data_flows : (
        length(v.source) >= 1
      )
    ])
    error_message = "Each source list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_data_flows : (
        v.script == null || (length(v.script) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_data_flows : (
        v.script_lines == null || (alltrue([for x in v.script_lines : length(x) > 0]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_data_flows : (
        alltrue([for item in v.source : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_data_flows : (
        alltrue([for item in v.source : (item.description == null || (length(item.description) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_data_flows : (
        alltrue([for item in v.source : (item.dataset == null || (length(item.dataset.name) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_data_flows : (
        alltrue([for item in v.source : (item.flowlet == null || (length(item.flowlet.name) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_data_flows : (
        alltrue([for item in v.source : (item.flowlet == null || (item.flowlet.dataset_parameters == null || (length(item.flowlet.dataset_parameters) > 0)))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_data_flows : (
        alltrue([for item in v.source : (item.linked_service == null || (length(item.linked_service.name) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_data_flows : (
        alltrue([for item in v.source : (item.rejected_linked_service == null || (length(item.rejected_linked_service.name) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_data_flows : (
        alltrue([for item in v.source : (item.schema_linked_service == null || (length(item.schema_linked_service.name) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_data_flows : (
        alltrue([for item in v.sink : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_data_flows : (
        alltrue([for item in v.sink : (item.description == null || (length(item.description) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_data_flows : (
        alltrue([for item in v.sink : (item.dataset == null || (length(item.dataset.name) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_data_flows : (
        alltrue([for item in v.sink : (item.flowlet == null || (length(item.flowlet.name) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_data_flows : (
        alltrue([for item in v.sink : (item.flowlet == null || (item.flowlet.dataset_parameters == null || (length(item.flowlet.dataset_parameters) > 0)))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_data_flows : (
        alltrue([for item in v.sink : (item.linked_service == null || (length(item.linked_service.name) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_data_flows : (
        alltrue([for item in v.sink : (item.rejected_linked_service == null || (length(item.rejected_linked_service.name) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_data_flows : (
        alltrue([for item in v.sink : (item.schema_linked_service == null || (length(item.schema_linked_service.name) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_data_flows : (
        v.transformation == null || alltrue([for item in v.transformation : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_data_flows : (
        v.transformation == null || alltrue([for item in v.transformation : (item.description == null || (length(item.description) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_data_flows : (
        v.transformation == null || alltrue([for item in v.transformation : (item.dataset == null || (length(item.dataset.name) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_data_flows : (
        v.transformation == null || alltrue([for item in v.transformation : (item.flowlet == null || (length(item.flowlet.name) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_data_flows : (
        v.transformation == null || alltrue([for item in v.transformation : (item.flowlet == null || (item.flowlet.dataset_parameters == null || (length(item.flowlet.dataset_parameters) > 0)))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_data_flows : (
        v.transformation == null || alltrue([for item in v.transformation : (item.linked_service == null || (length(item.linked_service.name) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_data_flows : (
        v.description == null || (length(v.description) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_data_flows : (
        v.folder == null || (length(v.folder) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

