resource "aws_internet_gateway" "default-ig" {
  vpc_id = var.vpc_id
  tags = {
    Name = "default-internet-gateway"
  }
}

resource "aws_route_table" "public-rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default-ig.id
  }

  tags = {
    Name = "public-rt"
  }
}

resource "aws_subnet" "public-subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}a"

  tags = {
    Name = "main-public-subnet"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}c"

  tags = {
    Name = "main-private-subnet"
  }
}

resource "aws_route_table_association" "rt-association-a" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public-rt.id
}
