#We configure the AWS provider
provider "aws" {
  region = "us-east-1"
}

#We create a security group.
resource "aws_security_group" "sg_example_06" {
  name        = var.sg_name
  description = var.sg_description
}

# We create the inbound rules of the security group.
#We use a loop to iterate over the list of ports defined as a variable.
resource "aws_security_group_rule" "ingress" {
  security-group_id = aws_security_group.sg_example_06.id
  type              = ingress

  count       = length(var.allowed_ingress_ports)
  from_port   = var.allowed_ingress_ports[count.index]
  to_port     = var.allowed_ingress_ports[count.index]
  protocol    = tcp
  cidr_blocks = ["0.0.0.0/0"]


}
#We create the outbound rules of the security group.
resource "aws_security_group_rule" "egress" {
  security-group_id = aws_security_group.sg_example_06.id
  type              = egress

  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}


#we create an EC2 instance
resource "aws_instance" "instance_example_06" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = [aws_security_group.sg_example_06.name]

  tags = {
    Name = var.instance_name
  }
}

#We create an elastic IP and associate it with the instance.
resource "aws_eip" "elastic_ip" {
  instance = aws_instance.instance_example_06.id
}