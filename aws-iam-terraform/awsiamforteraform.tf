provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "developer" {
  name = "developer-user"
}