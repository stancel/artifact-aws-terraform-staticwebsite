# S3 bucket resource
resource "aws_s3_bucket" "Bucket" {
  bucket        = "${var.bucket_name}"
  acl           = "public-read"
  force_destroy = true

  policy = <<EOF
{
  "Version":"2012-10-17",
  "Statement": [{
   "Sid": "AddPerm",
   "Effect": "Allow",
   "Principal": "*",
   "Action": ["s3:GetObject"],
   "Resource": ["arn:aws:s3:::${var.bucket_name}/*"]
 }]
}
  EOF

  website {
    index_document = "index.html"
  }

  provisioner "local-exec" {
    command = "./upload.sh src"
  }
}
