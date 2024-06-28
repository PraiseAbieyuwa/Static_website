variable "environment" {
  description = "staging"
}

variable "name" {
  description = "deploy-static"
}

variable "domain" {
  description = "praise.com"
}

variable "index_document" {
  description = "Index document for the S3 bucket"
  default     = "index.html"
}

variable "error_document" {
  description = "Error document for the S3 bucket"
  default     = "error.html"
}
