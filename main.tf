provider "aws" {
  region = "us-east-2"
}

resource "aws_vpc" "cybersecurity_lab" {
  cidr_block = "10.10.0.0/16"

  tags = {
    Name = "Cybersecurity-lab-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.cybersecurity_lab.id
  cidr_block        = "10.10.1.0/24"
  availability_zone = "us-east-2a"

  tags = {
    Name = "cybersecurity-lab-public-subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.cybersecurity_lab.id
  cidr_block        = "10.10.2.0/24"
  availability_zone = "us-east-2a"

  tags = {
    Name = "cybersecurity-lab-private-subnet"
  }
}

resource "aws_internet_gateway" "lab_igw" {
  vpc_id = aws_vpc.cybersecurity_lab.id

  tags = {
    Name = "Cybersecurity-lab-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.cybersecurity_lab.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.lab_igw.id
  }

  tags = {
    Name = "cybersecurity-lab-public-rt"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "lab_server" {
  name        = "cybersecurity-lab-server-sg"
  description = "Security group for cybersecurity lab servers"
  vpc_id      = aws_vpc.cybersecurity_lab.id
}

resource "aws_vpc_security_group_egress_rule" "allow_all_ipv4" {
  security_group_id = aws_security_group.lab_server.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}