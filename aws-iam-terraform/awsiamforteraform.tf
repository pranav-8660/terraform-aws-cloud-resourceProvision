provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "developer" {
  name = "developer-user"
}

resource "aws_iam_user_policy_attachment" "developer_attach" {
  user = aws_iam_user.developer.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}