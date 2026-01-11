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
}

