provider "aws" {
  region = "us-east-1"
}

#create a bucket named as demo-test-bucket-pv8660
resource "aws_s3_bucket" "pixar_bucket" {
  bucket = "demo-test-bucket-pv8660"
}

#add some data(probably an image onto bucket created by terraform)

resource "aws_s3_object" "upload_one" {
  bucket = aws_s3_bucket.pixar_bucket.id
  key = "randImg.png"
  source = "/home/pranav/Pictures/Screenshots/randomimg.png"
}
