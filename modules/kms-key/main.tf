


variable "key_alias" {
  description = "The alias to associate with the KMS key"
  type        = string
}



resource "aws_kms_key" "test_key" {
  description             = "KMS key for encrypting sensitive data"
  enable_key_rotation     = true
  key_usage  = "ENCRYPT_DECRYPT"
  
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
  is_enabled               = true
  #policy = data.aws_iam_policy_document.kms_key_policy.json
  
 }




#resource "aws_iam_policy" "kms_policy" {
 # name   = "testing-kms-policy"
  #policy = data.aws_iam_policy_document.test_kms_policy.json
#}

#resource "aws_kms_key_policy" "test_kms_policy" {
 # key_id = aws_kms_key.test_key.key_id
  #policy = aws_iam_policy.kms_policy.policy
#}

resource "aws_kms_alias" "test_key_alias" {
  name          = var.key_alias
  target_key_id = aws_kms_key.test_key.key_id
  
}

output "kms_key_arn" {
  value = aws_kms_key.test_key.arn
}
