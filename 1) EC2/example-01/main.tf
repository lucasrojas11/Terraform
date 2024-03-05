#We configure the AWS provider
provider "aws" {
  region = "us-east-1"
}

#we create an EC2 instance
resource "aws_instance" "instance_example_01" {
  ami           = "ami-00874d747dde814fa"
  instance_type = "t2.small"
  key_name      = "vockey"
  tags = {
    Name = "instance_example_01"
  }
}

#we won't be able to connect the instance because it doesn't have a security group