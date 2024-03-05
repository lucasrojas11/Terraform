# How to run commands automatically when creating an EC2 instance
To execute commands automatically when creating an EC2 instance we can use the user_data argument of the aws_instance resource.

## Using a local script
```terraform
resource "aws_instance" "example_04" {
  ami                    = "ami-00874d747dde814fa"
  instance_type          = "t2.small"
  key_name               = "vockey"
  security_groups        = ...
  ...
  user_data              = "${file("path/to/script.sh")}"
}
```

## Using a remote script
```terraform
resource "aws_instance" "ejemplo_04" {
  ami                    = "ami-00874d747dde814fa"
  instance_type          = "t2.small"
  key_name               = "vockey"
  security_groups        = ...
  ...
  user_data              = "${http_file("https://example.com/script.sh")}"
}
```

## Specifying the list of commands in the `user_data` field
```terraform
resource "aws_instance" "ejemplo_04" {
  ami                    = "ami-00874d747dde814fa"
  instance_type          = "t2.small"
  key_name               = "vockey"
  security_groups        = ...
  ...
  user_data = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y apache2
  EOF
}
```
## Specifying the list of commands in the `remote-exec` provisioner
```terraform
resource "aws_instance" "ejemplo_04" {
  ami                    = "ami-00874d747dde814fa"
  instance_type          = "t2.small"
  key_name               = "vockey"
  security_groups        = ...
  ...
  provisioner "remote-exec" {
    inline = [
      "apt-get update",
      "apt-get install -y apache2"
    ]
  }
}
```