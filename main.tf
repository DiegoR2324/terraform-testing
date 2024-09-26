 provider "aws" {
  region  = "us-east-1"
  profile = "default"
 }
resource "aws_instance" "despliegue-terraform-ec2" {
  ami                    = "ami-0ebfd941bbafe70c6"
  instance_type          = "t2.micro"
  key_name               = "vockey"
  tags = {
    Name      = "terraform-test"
    Terraform = "true"		
  }
 }
