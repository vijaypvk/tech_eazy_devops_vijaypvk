provider "aws" {
  region = var.region
}

resource "aws_iam_role" "read_only_s3" {
  name = "ReadOnlyS3Role"
  assume_role_policy = data.aws_iam_policy_document.read_only_assume.json
}

data "aws_iam_policy_document" "read_only_assume" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "read_only_attach" {
  role       = aws_iam_role.read_only_s3.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

resource "aws_iam_role" "upload_only_s3" {
  name = "UploadOnlyS3Role"
  assume_role_policy = data.aws_iam_policy_document.upload_only_assume.json
}

data "aws_iam_policy_document" "upload_only_assume" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_policy" "upload_only_policy" {
  name        = "UploadOnlyToS3Policy"
  description = "Allow only PutObject to specific bucket"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = "s3:PutObject",
        Resource = "arn:aws:s3:::${var.bucket_name}/*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "upload_only_attach" {
  role       = aws_iam_role.upload_only_s3.name
  policy_arn = aws_iam_policy.upload_only_policy.arn
}

resource "aws_s3_bucket" "logs_bucket" {
  bucket = var.bucket_name

  lifecycle_rule {
    enabled = true

    expiration {
      days = 7
    }

    prefix = ""
  }

  tags = {
    Name = "logs-bucket"
  }
}

resource "aws_instance" "app_server" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  iam_instance_profile        = aws_iam_instance_profile.upload_profile.name
  associate_public_ip_address = true
  key_name                    = var.key_name

  user_data = file("userdata.sh")

  tags = {
    Name = "AppServerWithUploadRole"
  }
}

resource "aws_iam_instance_profile" "upload_profile" {
  name = "UploadOnlyProfile"
  role = aws_iam_role.upload_only_s3.name
}