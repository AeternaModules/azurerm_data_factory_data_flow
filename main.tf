resource "azurerm_data_factory_data_flow" "data_factory_data_flows" {
  for_each = var.data_factory_data_flows

  data_factory_id = each.value.data_factory_id
  name            = each.value.name
  annotations     = each.value.annotations
  description     = each.value.description
  folder          = each.value.folder
  script          = each.value.script
  script_lines    = each.value.script_lines

  sink {
    dynamic "dataset" {
      for_each = each.value.sink.dataset != null ? [each.value.sink.dataset] : []
      content {
        name       = dataset.value.name
        parameters = dataset.value.parameters
      }
    }
    description = each.value.sink.description
    dynamic "flowlet" {
      for_each = each.value.sink.flowlet != null ? [each.value.sink.flowlet] : []
      content {
        dataset_parameters = flowlet.value.dataset_parameters
        name               = flowlet.value.name
        parameters         = flowlet.value.parameters
      }
    }
    dynamic "linked_service" {
      for_each = each.value.sink.linked_service != null ? [each.value.sink.linked_service] : []
      content {
        name       = linked_service.value.name
        parameters = linked_service.value.parameters
      }
    }
    name = each.value.sink.name
    dynamic "rejected_linked_service" {
      for_each = each.value.sink.rejected_linked_service != null ? [each.value.sink.rejected_linked_service] : []
      content {
        name       = rejected_linked_service.value.name
        parameters = rejected_linked_service.value.parameters
      }
    }
    dynamic "schema_linked_service" {
      for_each = each.value.sink.schema_linked_service != null ? [each.value.sink.schema_linked_service] : []
      content {
        name       = schema_linked_service.value.name
        parameters = schema_linked_service.value.parameters
      }
    }
  }

  source {
    dynamic "dataset" {
      for_each = each.value.source.dataset != null ? [each.value.source.dataset] : []
      content {
        name       = dataset.value.name
        parameters = dataset.value.parameters
      }
    }
    description = each.value.source.description
    dynamic "flowlet" {
      for_each = each.value.source.flowlet != null ? [each.value.source.flowlet] : []
      content {
        dataset_parameters = flowlet.value.dataset_parameters
        name               = flowlet.value.name
        parameters         = flowlet.value.parameters
      }
    }
    dynamic "linked_service" {
      for_each = each.value.source.linked_service != null ? [each.value.source.linked_service] : []
      content {
        name       = linked_service.value.name
        parameters = linked_service.value.parameters
      }
    }
    name = each.value.source.name
    dynamic "rejected_linked_service" {
      for_each = each.value.source.rejected_linked_service != null ? [each.value.source.rejected_linked_service] : []
      content {
        name       = rejected_linked_service.value.name
        parameters = rejected_linked_service.value.parameters
      }
    }
    dynamic "schema_linked_service" {
      for_each = each.value.source.schema_linked_service != null ? [each.value.source.schema_linked_service] : []
      content {
        name       = schema_linked_service.value.name
        parameters = schema_linked_service.value.parameters
      }
    }
  }

  dynamic "transformation" {
    for_each = each.value.transformation != null ? [each.value.transformation] : []
    content {
      dynamic "dataset" {
        for_each = transformation.value.dataset != null ? [transformation.value.dataset] : []
        content {
          name       = dataset.value.name
          parameters = dataset.value.parameters
        }
      }
      description = transformation.value.description
      dynamic "flowlet" {
        for_each = transformation.value.flowlet != null ? [transformation.value.flowlet] : []
        content {
          dataset_parameters = flowlet.value.dataset_parameters
          name               = flowlet.value.name
          parameters         = flowlet.value.parameters
        }
      }
      dynamic "linked_service" {
        for_each = transformation.value.linked_service != null ? [transformation.value.linked_service] : []
        content {
          name       = linked_service.value.name
          parameters = linked_service.value.parameters
        }
      }
      name = transformation.value.name
    }
  }
}

