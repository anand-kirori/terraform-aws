# Output variable definitions

output "vpc_public_subnets" {
  description = "IDs of the VPC's public subnets"
  value       = module.vpc.public_subnets
}

output "ec2_instance_public_ips" {
  description = "Public IP addresses of EC2 instances"
  value       = module.ec2_instances.public_ip
}

output "ec2_instance_id" {
  description = "ID of the EC2 instance"
  value       = module.ec2_instances.id
}

output "security_group_id" {
  description = "Security Group ID"
  value = module.custom_service_sg.security_group_id
}

output "security_group_name" {
  description = "Security Group Name"
  value = module.custom_service_sg.security_group_name
}
