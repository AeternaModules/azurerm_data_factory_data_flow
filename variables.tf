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
    sink = object({
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
    })
    source = object({
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
    })
    transformation = optional(object({
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
    }))
  }))
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
        v.script_lines == null || (length(v.script_lines) > 0)
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
  # --- Unconfirmed validation candidates, derived from azurerm_data_factory_data_flow's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: data_factory_id
  #   source:    [from factories.ValidateFactoryID] !ok
  # path: data_factory_id
  #   source:    [from factories.ValidateFactoryID] err != nil
}

