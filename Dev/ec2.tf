
locals {
  user_data = <<-EOT
  #!/bin/bash
  cd /tmp
  sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
  sudo systemctl enable amazon-ssm-agent
  sudo systemctl start amazon-ssm-agent
  EOT
}

module "ec2_instances" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.12.0"

  name           = var.instance_name
  instance_count = 1

  ami                    = var.instance_ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id              = module.vpc.public_subnets[0]
  iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
  user_data_base64 = base64encode(local.user_data)

  tags = var.instance_tags
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "ssm_profile"
  role = "${aws_iam_role.role.name}"
}
