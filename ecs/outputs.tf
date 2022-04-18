output "ecs_metadata_from_module" {
  value = aws_ecs_cluster.ecs_blockchain_cluster
}




#
# resource "aws_ecs_cluster_capacity_providers" "ecs_capacity_provider" {
#   cluster_name       = aws_ecs_cluster.ecs_blockchain_cluster.name
#   capacity_providers = ["FARGATE"]
# }
