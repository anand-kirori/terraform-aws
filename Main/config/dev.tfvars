vpc_name  = "terraform-vpc"
vpc_cidr  =  "10.0.0.0/16"
vpc_azs   = ["us-east-1a", "us-east-1b", "us-east-1c"]
vpc_private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
vpc_public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]
vpc_tags = {
    Terraform   = "true"
    Environment = "dev"
    Owner = "Anand Kirori"
  }
aws_region = "us-east-1"
instance_name = "Test Instance"
instance_type = "t4g.micro"
instance_ami = "ami-0d0115d627f8ee8c8"
instance_tags = {
    Terraform   = "true"
    Environment = "dev"
    Owner = "Anand Kirori"
  }
