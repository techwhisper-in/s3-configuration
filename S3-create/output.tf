output "bucket-name" {
    #count=var.infra_create?1:0
  value = try(module.S3.bucket-configuration[0].id,"(Not Created)")
}