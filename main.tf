module "test_kms_key" {
  source = "./modules/kms-key"
  key_alias  = "alias/testing-for-key"
  #key_name        = "first-test-key"
  #key_description = "First Test KMS key"

  
}
variable "key_alias" {
  description = "The alias to associate with the KMS key"
  type        = string
  default = ""
}

output "kms_key_arn" {
  value = module.test_kms_key.kms_key_arn
}
