terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "rails_server" {
  ami           = "ami-049ae1d9194a36e20"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}

resource "aws_db_instance" "default" {
  allocated_storage    = 1
  engine               = "postgresql"
  engine_version       = "13"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "postgres"
  password             = "postgres"
  publicly_accessible  = true
  skip_final_snapshot  = true
}

resource "aws_s3_bucket" "weather_bucket" {
  bucket = "open-weather-bucket"
  acl    = "public-read"

  tags = {
    Name        = var.project_name
    Environment = var.environment
  }
}
