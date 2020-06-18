module "label" {
  source      = "../../"
  oe          = "azt"
  project     = "TestProj"
  region      = "eu-central-1"
  environment = "dev"
  service     = "ec2"
  role        = "myApp"
  ext         = "1"
  attributes  = ["public", "1"]
  tags        = "${map("cost_center", "123456789", "Debitor", "70000001")}"
}
