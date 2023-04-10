data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "kms_key_policy" {
  # Allow root users full management access to key
  policy_id = "MyPolicy"
  statement {
    
    effect = "Allow"
    principals  {
      type = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }
    actions = [
      "kms:Encrypt",
      "kms:Decrytpt"
    ]
    resources=["*"]
 }
 }
      
