module "S3" {
  #count = var.infra_create=="true" ? 1 : 0
  source     = "../modules/s3_bucket"
  infra_account = var.infra_account
  Reg        = var.infra_region
  infra_tags = var.infra_tags
  infra_create = var.infra_create
  assume_role_arn = var.assume_role_arn
}
