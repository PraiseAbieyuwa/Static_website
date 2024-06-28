resource "aws_s3_bucket" "s3_bucket" {
  bucket = "${var.environment}-${var.name}"
  acl    = "private"

  tags = {
    Name        = "${var.environment}-${var.name}"
    Environment = var.environment
  }
}

data "aws_iam_policy_document" "s3_bucket" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.s3_bucket.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.s3_bucket.iam_arn]
    }
  }

  statement {
    actions   = ["s3:ListBucket"]
    resources = [aws_s3_bucket.s3_bucket.arn]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.s3_bucket.iam_arn]
    }
  }
}

resource "aws_s3_bucket_policy" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id
  policy = data.aws_iam_policy_document.s3_bucket.json
}

resource "aws_cloudfront_origin_access_identity" "s3_bucket" {
  comment = "origin identity for ${var.environment}-${var.name}"
}
