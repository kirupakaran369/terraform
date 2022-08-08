provider "aws" {
  # if user doesn't have a IAM access, then they could use accesskey and secretkey
  # access_key = var.aws_access_key
  # secret_key = var.aws_secret_key
  region = var.REGION
}
