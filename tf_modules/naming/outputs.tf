output "id" {
  value       = null_resource.default[0].triggers.id
  description = "Disambiguated ID"
}

output "oe" {
  value       = null_resource.default[0].triggers.oe
  description = "Normalized OE"
}

output "project" {
  value       = null_resource.default[0].triggers.project
  description = "Normalized project name"
}

output "environment" {
  value       = null_resource.default[0].triggers.environment
  description = "Normalized environment"
}

output "service" {
  value       = null_resource.default[0].triggers.service
  description = "Normalized service name"
}

output "role" {
  value       = null_resource.default[0].triggers.role
  description = "Normalized role or scope"
}

output "attributes" {
  value       = null_resource.default[0].triggers.attributes
  description = "Normalized attributes"
}

# Merge input tags with our tags.
# Note: `Name` has a special meaning in AWS and we need to disamgiuate it by using the computed `id`
output "tags" {
  value = merge(
    {
      "Name"        = null_resource.default[0].triggers.id
      "OE"          = null_resource.default[0].triggers.oe
      "Project"     = null_resource.default[0].triggers.project
      "Region"      = data.aws_region.current.name
      "Environment" = null_resource.default[0].triggers.environment
      "Role"        = null_resource.default[0].triggers.role
    },
    var.tags,
  )

  description = "Normalized Tag map"
}

# TODO: Add additional Tags to List
output "tag_list" {
  value = [
    {
      key                 = "Name"
      value               = null_resource.default[0].triggers.id
      propagate_at_launch = true
    },
    {
      key                 = "OE"
      value               = null_resource.default[0].triggers.oe
      propagate_at_launch = true
    },
    {
      key                 = "Project"
      value               = null_resource.default[0].triggers.project
      propagate_at_launch = true
    },
    {
      key                 = "Region"
      value               = data.aws_region.current.name
      propagate_at_launch = true
    },
    {
      key                 = "Environment"
      value               = null_resource.default[0].triggers.environment
      propagate_at_launch = true
    },
    {
      key                 = "Role"
      value               = null_resource.default[0].triggers.role
      propagate_at_launch = true
    },
  ]
}

