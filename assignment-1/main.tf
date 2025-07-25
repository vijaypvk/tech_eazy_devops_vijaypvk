provider "aws" {
  region = "us-east-1"  
}

# Get security group details
data "aws_security_group" "selected" {
  id = var.security_group_id
}

# Get list of subnets in that security group's VPC
data "aws_subnets" "matching_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_security_group.selected.vpc_id]
  }
}

# Pick the first subnet from the result
data "aws_subnet" "chosen" {
  id = data.aws_subnets.matching_subnets.ids[0]
}

resource "aws_instance" "app_server" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [var.security_group_id]
  subnet_id                   = data.aws_subnet.chosen.id
  user_data                   = file("${path.module}/userdata.sh")

  tags = {
    Name  = "zero-mile-${var.stage}"
    Stage = var.stage
  }
}
