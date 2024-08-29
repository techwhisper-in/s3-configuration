variable "infra_create" {
  type        = bool
  description = "Value should be true to create infra"
  default     = false
}
variable "infra_region" {
  type        = string
  default     = "us-east-1"
  description = "Region where resource to be deployed"
}

variable "infra_tags" {
  type = map(any)
  default = {

  }
}
