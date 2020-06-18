locals {
  region_map = {
    "us-east-1"      = "ue1"
    "us-east-2"      = "ue2"
    "us-west-1"      = "uw1"
    "us-west-2"      = "uw2"
    "ca-central-1"   = "cc1"
    "ca-central-2"   = "cc2"
    "eu-west-1"      = "ew1"
    "eu-west-2"      = "ew2"
    "eu-west-3"      = "ew3"
    "eu-central-1"   = "ec1"
    "ap-northeast-1" = "an1"
    "ap-northeast-2" = "an2"
    "ap-southeast-1" = "ase1"
    "ap-southeast-2" = "ase2"
    "ap-south-1"     = "as1"
    "sa-east-1"      = "se1"
  }

  region_short = local.region_map[data.aws_region.current.name]
}

data "aws_region" "current" {
}

resource "null_resource" "default" {
  count = var.enabled == "true" ? 1 : 0

  triggers = {
    id = lower(
      join(
        var.delimiter,
        compact(
          concat(
            [
              var.service,
              var.project,
              local.region_short,
              var.environment,
              var.role,
              var.ext,
            ],
            var.attributes,
          ),
        ),
      ),
    )
    oe          = lower(format("%v", var.oe))
    project     = lower(format("%v", var.project))
    environment = lower(format("%v", var.environment))
    service     = lower(format("%v", var.service))
    role        = lower(format("%v", var.role))
    ext         = lower(format("%v", var.ext))
    attributes  = lower(format("%v", join(var.delimiter, compact(var.attributes))))
  }

  lifecycle {
    create_before_destroy = true
  }
}

