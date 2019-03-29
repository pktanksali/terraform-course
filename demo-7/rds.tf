resource "aws_db_subnet_group" "prasad-mariadb-subnet" {
    name = "prasad-mariadb-subnet"
    description = "RDS subnet group"
    subnet_ids = ["${aws_subnet.prasad-main-private-1.id}","${aws_subnet.prasad-main-private-2.id}"]
}

resource "aws_db_parameter_group" "prasad-mariadb-parameters" {
    name = "prasad-mariadb-parameters"
    family = "mariadb10.1"
    description = "MariaDB parameter group"

    parameter {
      name = "max_allowed_packet"
      value = "16777216"
   }

}


resource "aws_db_instance" "mariadb" {
  allocated_storage    = 20    # 100 GB of storage, gives us more IOPS than a lower number
  engine               = "mariadb"
  engine_version       = "10.1.14"
  instance_class       = "db.t2.micro"    # use micro if you want to use the free tier
  identifier           = "mariadb"
  name                 = "mariadb"
  username             = "root"   # username
  password             = "${var.RDS_PASSWORD}" # password
  db_subnet_group_name = "${aws_db_subnet_group.prasad-mariadb-subnet.name}"
  parameter_group_name = "${aws_db_parameter_group.prasad-mariadb-parameters.name}"
  multi_az             = "false"     # set to true to have high availability: 2 instances synchronized with each other
  vpc_security_group_ids = ["${aws_security_group.allow-mariadb.id}"]
  storage_type         = "gp2"
  backup_retention_period = 10    # how long you’re going to keep your backups
  availability_zone = "${aws_subnet.prasad-main-private-1.availability_zone}"   # prefered AZ
  skip_final_snapshot = true   # skip final snapshot when doing terraform destroy
  tags {
      Name = "prasad-mariadb-instance"
  }
}
