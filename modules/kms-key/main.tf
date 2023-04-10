resource "aws_kms_key" "test_key" {
  description = var.key_description
  #key_usage  = "ENCRYPT_DECRYPT"
  customer_master_key_specification {
    algorithm = "SYMMETRIC_DEFAULT"
  }
 }

data "aws_iam_policy_document" "test_kms_policy" {
  statement {
    actions   = ["kms:Encrypt", "kms:Decrypt"]
    resources = [aws_kms_key.test_key.arn]
    effect    = "Allow"
  }
}

resource "aws_iam_policy" "example_kms_policy" {
  name   = "example-kms-policy"
  policy = data.aws_iam_policy_document.test_kms_policy.json
}

resource "aws_kms_key_policy" "test_kms_policy" {
  key_id = aws_kms_key.test_key.key_id
  policy = aws_iam_policy.test_kms_policy.policy
}

output "kms_key_arn" {
  value = aws_kms_key.test_key.arn
}
