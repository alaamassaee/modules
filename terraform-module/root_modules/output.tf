output "vpc" {
  description = "ID of VPC"
  value       = module.networking.vpc_id
}
output "subnet" {
  description = "ID of SUBNET"
  value       = module.networking.subnet_id
}
output "sg_id" {
  description = "ID of SG"
  value       = module.sg-module.sg_id
}
output "key_name" {
  description = "ID of SSH"
  value       = module.ssh_key.key_name
}
output "public_ip" {
  value = module.ec2-module.public_ip
}


