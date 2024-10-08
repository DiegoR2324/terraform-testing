 provider "aws" {
  region  = "us-east-1"
  profile = "default"
 }
resource "aws_instance" "despliegue-terraform-ec2" {
  ami                    = "ami-0ebfd941bbafe70c6"
  instance_type          = "t2.micro"
  key_name               = "vockey"
  tags = {
    Name      = "terra-part2"
    Terraform = "true"		
  }
 }

resource "aws_security_group" "test_terraform_sg" {
  name = "test_terraform_sg"
  vpc_id = "vpc-049a46e013597a243"
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.test_terraform_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.test_terraform_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
