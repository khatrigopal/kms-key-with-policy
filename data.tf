data "aws_caller_identity" "current" {}

data "aws_iam_user" "current" {}

data "aws_iam_policy_document" "kms_key_policy" {
  # Allow root users full management access to key
  
  statement {
    
    effect = "Allow"
    principals  {
      type = "AWS"
      identifiers = [data.aws_iam_user.current_user.arn]
       # "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root", 
        #"arn:aws_iam_user.current_user.arn"                           
      #]
    }
    actions = [
      "kms:Encrypt",
      "kms:Decrytpt"
    ]
    resources=[""]
 }
 }
      
