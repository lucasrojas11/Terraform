#We configure the AWS provider
provider "aws" {
  region = "us-east-1"
}

#We create a security group.
resource "aws_security_group" "sg_example_03" {
  name        = sg_example_03
  description = "Security group for instance example 03."


  # Input rules to allow SSH, HTTP, and HTTPS traffic.
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Output rules to allow all outgoing connections.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#we create an EC2 instance
resource "aws_instance" "instance_example_03" {
  ami             = "ami-00874d747dde814fa"
  instance_type   = "t2.small"
  key_name        = "vockey"
  security_groups = [aws_security_group.sg_example_03.name]

  tags = {
    Name = "instance_example_03"
  }
}

#We create an elastic IP and associate it with the instance.
resource "aws_eip" "elastic_ip" {
  instance = aws_instance.instance_example_03.id
}


#We create an output variable with the instance's public IP.
output "public_ip" {
  value = aws.instance.instance_example_03.public_ip
}