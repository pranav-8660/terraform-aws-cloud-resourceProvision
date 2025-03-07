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

resource "aws_iam_role" "ec2_role" {
  name = "EC2AccessRole"
  assume_role_policy = <<EOF
  {
    "Version":"2012-10-17",
    "Statement":[
    {
        "Effect":"Allow",
        "Principal":{
        "Service":"ec2.amazonaws.com"
        },
        "Action":"sts:AssumeRole"
    }
    ]
  }
  EOF

}

resource "aws_iam_role_policy_attachment" "admin_role_attach" {
  role       = aws_iam_role.ec2_role.name  
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}


resource "aws_iam_instance_profile" "ec2_profile" {
    name = "ec2-instance-profile"
    role = aws_iam_role.ec2_role.name
}