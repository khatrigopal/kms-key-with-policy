module "test_kms_key" {
  source = "./modules/kms-key"

  key_name        = "first-test-key"
  key_description = "First Test KMS key"

  
}

output "kms_key_arn" {
  value = module.test_kms_key.kms_key_arn
}
