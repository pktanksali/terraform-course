output "elb" {
  value = "${aws_elb.prasadapp-elb.dns_name}"
}
