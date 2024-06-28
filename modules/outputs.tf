output "s3_bucket_website_url" {
  value = module.s3_bucket.bucket_domain_name
}

output "cloudfront_distribution_domain" {
  value = module.cloudfront.cloudfront_domain_name
}
