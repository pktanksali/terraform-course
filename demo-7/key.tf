resource "aws_key_pair" "prasadkeypair" {
  key_name = "prasadkeypair"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}
