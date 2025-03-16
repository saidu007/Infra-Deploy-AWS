terraform {
    backend "s3" {
        bucket = "erie-dev-tf-state-bucket"
        key = "main"
        region = "ap-south-1"
        dynamodb_table = "my-dynamodb-table"
    }
}

provider "aws" {
  region = "ap-south-1"  
}

# Security Group
resource "aws_security_group" "ERIE-ec2_sg" {
  name        = "ERIE-ec2-security-group"
  description = "Security group for EC2 instance"
  
  # Ingress rules (allow inbound traffic)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere (use caution)
  }


  # Egress rules (allow outbound traffic)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 instance
resource "aws_instance" "ERIE-EC2-Instance" {
  ami           = "ami-02ddb77f8f93ca4ca"  # Replace with your AMI ID
  instance_type = "t2.micro"  # Adjust instance type if necessary
  security_groups = [aws_security_group.ERIE-ec2_sg.name]
  key_name = "jenkins-key"
  
  tags = {
    Name = "ERIE-EC2-Instance"
  }
}

resource "aws_s3_bucket" "ERIE_s3_State_bucket" {
  bucket_prefix = "ERIE-s3"  # Replace with a unique bucket name
  acl    = "private"  # You can change this to 'public-read', 'private', etc.

  # Optional: Versioning
  versioning {
    enabled = true
  }

  # Optional: Tags
  tags = {
    Name        = "ERIE S3 Bucket"
    Environment = "Dev"
  }
}
