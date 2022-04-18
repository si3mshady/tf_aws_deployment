
# output "elliott_vpc_public_sg" {
#   value = module.vpc
# }


output "elliott_vpc_id" {
  value = module.vpc.elliott_vpc_id
}


output "elliott_vpc_public_sg_id" {
  value = module.vpc.elliott_public_sg.id
}

output "public_subnets" {
  value = module.vpc.vpc_public_subnets[*].id
}
