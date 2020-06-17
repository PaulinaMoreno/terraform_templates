resource "aws_s3_bucket" "tfstate02" {
  bucket = "${module.label.id}"
  acl    = "${var.s3_bucket_acl}"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "${var.s3_bucket_encrypt_algoritm}"
      }
    }
  }

  versioning {
    enabled = "${var.s3_bucket_versioning}"
  }
}

/*
resource "aws_s3_bucket_policy" "tfstate02" {
  bucket = "${aws_s3_bucket.tfstate.id}"
  policy = "${file("${path.module}/aztec-cloudtribe-privbucket-policy.json")}"
}
*/

/* Locking: found on https://github.com/hashicorp/terraform/issues/12877#issuecomment-289920798

resource "aws_dynamodb_table" "terraform_statelock" {
  name           = "foo"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

*/

