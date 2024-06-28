module "s3_bucket" {
  source      = "./modules/s3"
  environment = var.environment
  name        = var.name
  index_document = var.index_document
  error_document = var.error_document
}
