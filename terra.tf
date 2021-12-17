provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA3EFWYTI5T5AY5IJK"
  secret_key = "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"
}

resource "aws_instance" "us-east-1" {
  ami = "ami-04505e74c0741db8d"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-instance"
  }
}

resource "aws_s3_bucket" "myfirstbucket"{
bucket = "myuniquename243"
acl = "private"

tags = {
Name = "mys3bucket"
Environment = "Test-env"
}
versioning {
enabled = true
}
}

resource "aws_db_instance" "default" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}

resource "aws_vpc" "test" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "test-terraform"
  }
}
resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.test.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "terraform-subnet"
  }
}
