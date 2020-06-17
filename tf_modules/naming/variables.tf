variable "oe" {
  default     = "azt"
  description = "Allianz OE with the typical accronym, e.g. 'azt' for Allianz Technology"
}

variable "project" {
  default     = ""
  description = "Project name if projects has it's own environment"
}

variable "environment" {
  default     = "dev"
  description = "Environment to deploy resources, e.g. 'prod', 'test', 'dev', or 'shared'"
}

variable "service" {
  description = "AWS service, e.g 'sg' for security group or 'elb' for elastic load balancer"
}

variable "role" {
  description = "Role or Scope of the Service, e.g. 'ldap' or application name like 'jenkins'"
}

variable "ext" {
  description = "extension to the full name, e.g. Sequenze or additional name"
  default     = ""
}

variable "enabled" {
  description = "Set to false to prevent the module from creating any resources"
  default     = "true"
}

variable "delimiter" {
  type        = string
  default     = "_"
  description = "Delimiter to be used between `name`, `namespace`, `stage`, etc."
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `policy` or `role`)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit`,`XYZ`)"
}

