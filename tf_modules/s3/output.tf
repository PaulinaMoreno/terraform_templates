output "bucket-name" {
  value = "${aws_s3_bucket.tfstate02.id}"
}

output "bucket-arn" {
  value = "${aws_s3_bucket.tfstate02.arn}"
}
