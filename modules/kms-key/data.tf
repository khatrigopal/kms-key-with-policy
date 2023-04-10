data "aws_iam_policy_document" "test_kms_policy" {
  # Allow root users full management access to key
  statement {
    #sid = "Allow Access"
    effect = "Allow"
    actions = ["kms:Encrypt", "kms:Decrypt"]
    
    resources = [aws_kms_key.test_key.arn]
    #principal = {
      #AWS = "*"
    #}
     # identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
     # identifiers = ["*"]
    #}
  }
}
