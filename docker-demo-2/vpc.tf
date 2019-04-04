# Internet VPC
resource "aws_vpc" "prasad-main" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    tags {
        Name = "prasad-main"
    }
}


# Subnets
resource "aws_subnet" "prasad-main-public-1" {
    vpc_id = "${aws_vpc.prasad-main.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1a"

    tags {
        Name = "prasad-main-public-1"
    }
}
resource "aws_subnet" "prasad-main-public-2" {
    vpc_id = "${aws_vpc.prasad-main.id}"
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1b"

    tags {
        Name = "prasad-main-public-2"
    }
}
resource "aws_subnet" "prasad-main-public-3" {
    vpc_id = "${aws_vpc.prasad-main.id}"
    cidr_block = "10.0.3.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1c"

    tags {
        Name = "prasad-main-public-3"
    }
}
resource "aws_subnet" "prasad-main-private-1" {
    vpc_id = "${aws_vpc.prasad-main.id}"
    cidr_block = "10.0.4.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-1a"

    tags {
        Name = "prasad-main-private-1"
    }
}
resource "aws_subnet" "prasad-main-private-2" {
    vpc_id = "${aws_vpc.prasad-main.id}"
    cidr_block = "10.0.5.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-1b"

    tags {
        Name = "prasad-main-private-2"
    }
}
resource "aws_subnet" "prasad-main-private-3" {
    vpc_id = "${aws_vpc.prasad-main.id}"
    cidr_block = "10.0.6.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-1c"

    tags {
        Name = "prasad-main-private-3"
    }
}

# Internet GW
resource "aws_internet_gateway" "prasad-main-gw" {
    vpc_id = "${aws_vpc.prasad-main.id}"

    tags {
        Name = "prasad-main"
    }
}

# route tables
resource "aws_route_table" "prasad-main-public" {
    vpc_id = "${aws_vpc.prasad-main.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.prasad-main-gw.id}"
    }

    tags {
        Name = "prasad-main-public-1"
    }
}

# route associations public
resource "aws_route_table_association" "prasad-main-public-1-a" {
    subnet_id = "${aws_subnet.prasad-main-public-1.id}"
    route_table_id = "${aws_route_table.prasad-main-public.id}"
}
resource "aws_route_table_association" "prasad-main-public-2-a" {
    subnet_id = "${aws_subnet.prasad-main-public-2.id}"
    route_table_id = "${aws_route_table.prasad-main-public.id}"
}
resource "aws_route_table_association" "prasad-main-public-3-a" {
    subnet_id = "${aws_subnet.prasad-main-public-3.id}"
    route_table_id = "${aws_route_table.prasad-main-public.id}"
}
