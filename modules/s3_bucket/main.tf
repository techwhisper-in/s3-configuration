data "aws_caller_identity" "current" {
    #count = var.infra_create ? 1 : 0
}
data "aws_region" "current" {
    #count = var.infra_create ? 1 : 0
}

resource "aws_s3_bucket" "s3_bucket" {
  count = var.infra_create ? 1 : 0
  bucket = "harness-${var.Reg}-lambda-${var.infra_account}"
  tags   = merge({ Name = "harness-${var.Reg}-lambda-${var.infra_account}" }, var.infra_tags)

}

resource "aws_s3_bucket_ownership_controls" "s3_ownership" {
  count = var.infra_create ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket[0].id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "s3_acl" {
  count = var.infra_create ? 1 : 0
  depends_on = [aws_s3_bucket_ownership_controls.s3_ownership]
  bucket = aws_s3_bucket.s3_bucket[0].id
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encryption" {
  count = var.infra_create ? 1 : 0
  depends_on = [aws_s3_bucket.s3_bucket]
  bucket     = aws_s3_bucket.s3_bucket[0].id
  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = "arn:aws:kms:${var.Reg}:${var.infra_account}:key/3f97fc47-7661-454f-82f7-ec87b3bd5526"
      sse_algorithm     = "aws:kms"
    }
    bucket_key_enabled = true
  }

}

