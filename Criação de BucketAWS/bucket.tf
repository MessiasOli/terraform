resource "aws_s3_bucket" "first_bucket" {
  bucket = "curso-terraform-messias"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}