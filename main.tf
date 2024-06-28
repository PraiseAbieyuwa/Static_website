module "s3_bucket" {
  source      = "./modules/s3_bucket"
  environment = var.environment
  name        = var.name
}

module "cloudfront" {
  source      = "./modules/cloudfront"
  environment = var.environment
  name        = var.name
  root_object = var.root_object
  domain      = var.domain
  acm         = var.acm
}
