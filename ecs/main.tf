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

# TASK Def
resource "aws_ecs_task_definition" "ecs_task_def" {
  family = "blockchain_container_task"
  container_definitions = jsonencode([
    {
      name      = "elliotts_blockchain_app"
      image     = "si3mshady/blockchaindev"
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 3000
        }
      ]
    }
  ])

}

#ECS Service



#IAM ROLE + POLICY

data "aws_iam_policy_document" "kratos_policy_document" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}


resource "aws_iam_role" "ecs_kratos_role" {
  name = "ecs_kratos_role"
  # path               = "/system/"
  assume_role_policy = data.aws_iam_policy_document.kratos_policy_document.json
}
