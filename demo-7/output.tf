output "instance" {
  value = "${aws_instance.prasad-terraform-01.public_ip}"
}
output "rds" {
  value = "${aws_db_instance.mariadb.endpoint}"
}
