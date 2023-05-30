provider "aws" {
  region = "us-east-1"
  }

resource "aws_instance" "demo-server" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  key_name      = "devopsprj2"
  vpc_security_group_ids = [aws_security_group.demo-sg.id]
  subnet_id = aws_subnet.dpw-public_subent_01.id
  for_each = toset(["Jenkins-master","Jenkins-slave","Ansible"])
  tags = {
    Name = "${each.key}"
  }
} 



resource "aws_security_group" "demo-sg" {
  name        = "demo-sg"
  vpc_id = aws_vpc.dpw-vpc.id

  ingress {
    description      = "ssh access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["49.205.250.228/32","10.1.1.0/24"]
    
  }

  ingress {
    description      = "Jenkins GUI"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["49.205.250.228/32","10.1.1.0/24"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = {
    Name = "demo-server-sg"
  }
}
