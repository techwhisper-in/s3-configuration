variable "infra_create" {
  type        = bool
  description = "Value should be true to create infra"
  default     = false
}
variable "Reg" {
  type        = string
  default     = "us-east-1"
  description = "Region where resource to be deployed"
}
variable "infra_account" {
  type = string
}
variable "infra_tags" {
  type = map(any)
  default = {

  }
}
variable "assume_role_arn" {
  type = string
}