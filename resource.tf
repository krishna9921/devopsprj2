#AWS Resource 

# Create an AMI that will start a machine whose root device is backed by
# an EBS volume populated from a snapshot. It is assumed that such a snapshot
# already exists with the id "snap-xxxxxxxx".
resource "aws_instance" "demo-server" {
  ami = "ami-0715c1897453cabd1"
  instance_type = "t2.micro"
  key_name = "devopsprj2"

}

resource "" "name" {
  
}
# GOOGLE Resource

#AZURE Resource



