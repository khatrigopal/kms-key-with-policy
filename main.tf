module "test_kms_key" {
  source = "./modules/kms-key"
  key_alias  = "alias/change-policy-key"
  #key_name        = "first-test-key"
  #key_description = "First Test KMS key"
  key_policy = data.aws_iam_policy_document.kms_key_policy.json

  
}
variable "key_alias" {
  description = "The alias to associate with the KMS key"
  type        = string
  default = ""
}

output "kms_key_arn" {
  value = module.test_kms_key.kms_key_arn
}
