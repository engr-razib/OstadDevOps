# Random suffix for unique S3 bucket name
resource "random_id" "bucket_suffix" {
  byte_length = 4
}

# S3 Bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "terraform-assignment-bucket-${random_id.bucket_suffix.hex}"
  acl    = "private"

  tags = {
    Name = "TerraformAssignment-S3"
  }
}
