resource "aws_s3_bucket" "prasad-bucket" {
    bucket = "prasad-terrabucket"
    acl = "private"

    tags {
        Name = "prasad-terrabucket"
    }
}
