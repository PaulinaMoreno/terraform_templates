/* Will be build based on naming convention
  
variable "s3_bucket_name" {
  type = "string"
}
*/

variable "policy" {
  type    = "string"
  default = "policy.json"
}

variable "s3_bucket_acl" {
  type    = "string"
  default = "private"
}

variable "s3_bucket_versioning" {
  type    = "string"
  default = true
}

variable "s3_bucket_encrypt_algoritm" {
  type    = "string"
  default = "AES256"
}

variable "region" {
  default = "us-east-1"
}
