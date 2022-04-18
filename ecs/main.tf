resource "aws_ecs_cluster" "ecs_blockchain_cluster" {
  name = "ecs_blockchain_cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}



resource "aws_ecs_cluster_capacity_providers" "ecs_capacity_provider" {
  cluster_name       = aws_ecs_cluster.ecs_blockchain_cluster.name
  capacity_providers = ["FARGATE"]
}
