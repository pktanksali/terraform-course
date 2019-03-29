resource "aws_iam_role" "prasad-s3role" {
    name = "prasad-s3role"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "prasad-s3role-instanceprofile" {
    name = "prasad-s3role"
    role = "${aws_iam_role.prasad-s3role.name}"
}

resource "aws_iam_role_policy" "prasad-s3role-policy" {
    name = "prasad-s3role-policy"
    role = "${aws_iam_role.prasad-s3role.id}"
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
              "s3:*"
            ],
            "Resource": [
              "arn:aws:s3:::prasad-terrabucket",
              "arn:aws:s3:::prasad-terrabucket/*"
            ]
        }
    ]
}
EOF
}

