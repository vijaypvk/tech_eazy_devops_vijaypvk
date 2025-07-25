variable "region" {
  default = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID for EC2"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
}

variable "key_name" {
  description = "SSH key name"
}