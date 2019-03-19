# nat gw
resource "aws_eip" "nat" {
  vpc      = true
}
resource "aws_nat_gateway" "nat-gw" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id = "${aws_subnet.prasad-main-public-1.id}"
  depends_on = ["aws_internet_gateway.prasad-main-gw"]
}

# VPC setup for NAT
resource "aws_route_table" "prasad-main-private" {
    vpc_id = "${aws_vpc.prasad-main.id}"
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.nat-gw.id}"
    }

    tags {
        Name = "prasad-main-private-1"
    }
}
# route associations private
resource "aws_route_table_association" "prasad-main-private-1-a" {
    subnet_id = "${aws_subnet.prasad-main-private-1.id}"
    route_table_id = "${aws_route_table.prasad-main-private.id}"
}
resource "aws_route_table_association" "prasad-main-private-2-a" {
    subnet_id = "${aws_subnet.prasad-main-private-2.id}"
    route_table_id = "${aws_route_table.prasad-main-private.id}"
}
resource "aws_route_table_association" "prasad-main-private-3-a" {
    subnet_id = "${aws_subnet.prasad-main-private-3.id}"
    route_table_id = "${aws_route_table.prasad-main-private.id}"
}
