resource "aws_s3_bucket" "lifecycle" {
  bucket = "messias-lifecycle-2"

  lifecycle {
    #create_before_destroy = true
    #prevent_destroy = true
    ignore_changes = [
      tags
    ]
  }

  tags = {
    aula = "lifecycle"
  }
}