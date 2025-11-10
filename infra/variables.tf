variable "aws_region" {
  default = "ap-south-1" # Mumbai
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "ec2_instance_type" {
  default = "t3.micro"
}

variable "ec2_ami" {
  description = "Amazon Linux 2 AMI for Mumbai"
  default     = "ami-0d7733e7" # Mumbai region AMI ID for Amazon Linux 2 (update if needed)
}

variable "db_name" {
  default = "mydb"
}

variable "db_username" {
  default = "myadmin" # Not "admin", avoids reserved word issue
}

variable "db_password" {
  default = "MyPassword123!"
}