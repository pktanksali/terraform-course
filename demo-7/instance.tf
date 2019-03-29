resource "aws_instance" "prasad-terraform-01" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = "${aws_subnet.prasad-main-public-1.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.prasadkeypair.key_name}"

  # user data
  user_data = "${data.template_cloudinit_config.prasad-cloudinit.rendered}"

  # role:
  iam_instance_profile = "${aws_iam_instance_profile.prasad-s3role-instanceprofile.name}"
}

resource "aws_ebs_volume" "ebs-volume-1" {
    availability_zone = "us-east-1a"
    size = 20
    type = "gp2"
    tags {
        Name = "extra volume data"
    }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "${var.INSTANCE_DEVICE_NAME}"
  volume_id = "${aws_ebs_volume.ebs-volume-1.id}"
  instance_id = "${aws_instance.prasad-terraform-01.id}"
}
