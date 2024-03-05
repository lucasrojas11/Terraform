variable "region" {
  description = "AWS region where the instance will be created"
  type        = string
  default     = "us-east-1"
}

variable "allowed_ingress_ports" {
  description = "Security group inbound ports"
  type        = list(number)
  default     = [22, 80, 443]
}

variable "sg_name" {
  description = "Security group name"
  type        = string
  default     = "sg_example_05"
}

variable "sg_description" {
  description = "Security group description"
  type        = string
  default     = "Security group for instance example 05"
}

variable "ami_id" {
  description = "AMI identifier"
  type        = string
  default     = "ami-00874d747dde814fa"
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t2.small"
}

variable "key_name" {
  description = "Public key name"
  type        = string
  default     = "vockey"
}

variable "instance_name" {
  description = "Instance_name"
  type        = string
  default     = "instance_example_05"
}