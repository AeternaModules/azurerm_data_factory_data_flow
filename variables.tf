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
  # --- Unconfirmed validation candidates, derived from azurerm_data_factory_data_flow's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: data_factory_id
  #   source:    [from factories.ValidateFactoryID] !ok
  # path: data_factory_id
  #   source:    [from factories.ValidateFactoryID] err != nil
  # path: script
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: script_lines[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: source.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: source.description
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: source.dataset.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: source.flowlet.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: source.flowlet.dataset_parameters
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: source.linked_service.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: source.rejected_linked_service.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: source.schema_linked_service.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: sink.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: sink.description
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: sink.dataset.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: sink.flowlet.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: sink.flowlet.dataset_parameters
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: sink.linked_service.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: sink.rejected_linked_service.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: sink.schema_linked_service.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: transformation.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: transformation.description
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: transformation.dataset.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: transformation.flowlet.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: transformation.flowlet.dataset_parameters
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: transformation.linked_service.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: description
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: folder
  #   condition: length(value) > 0
  #   message:   must not be empty
}

