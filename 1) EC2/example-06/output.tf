#We display the public IP of the instance.
output "elastic_ip" {
  value = aws_eip.ip_elastica.public_ip
}