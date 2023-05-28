resource "aws_vpc" "dpw-vpc" {
    cidr_block = "10.1.0.0/16"
    tags = {
      Name = "dpw-vpc"
     }
   }

  //Create a Subnet 
resource "aws_subnet" "dpw-public_subent_01" {
    vpc_id = aws_vpc.dpw-vpc.id
    cidr_block = "10.1.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1a"
    tags = {
      Name = "dpw-public_subent_01"
    }
} 

//Creating an Internet Gateway 
resource "aws_internet_gateway" "dpw-igw" {
    vpc_id = aws_vpc.dpw-vpc.id
    tags = {
      Name = "dpw-igw"
    }
}

// Create a route table 
resource "aws_route_table" "dpw-public-rt" {
    vpc_id = aws_vpc.dpw-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.dpw-igw.id
    }
    tags = {
      Name = "dpw-public-rt"
    }
}

// Associate subnet with route table

resource "aws_route_table_association" "dpw-rta-public-subent-1" {
    subnet_id = aws_subnet.dpw-public_subent_01.id
    route_table_id = aws_route_table.dpw-public-rt.id
}