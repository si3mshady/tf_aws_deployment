# # main.tf - alb
# resource "aws_lb" "alb_ecs" {
#   # count              = length(var.alb_public_subnets)
#   name               = "alb-fargate"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [var.alb_public_sg.id]
#   subnets            = [for subnet in var.alb_public_subnets : subnet.id]
#
#   enable_deletion_protection = true
#
#
#   tags = {
#     Name        = "alb-ecs-fargate"
#     Environment = "production"
#   }
# }
#
# # resource "aws_lb_listener" "front_end" {
# #   load_balancer_arn = aws_lb.alb_ecs.arn
# #   port              = "3000"
# #   protocol          = "HTTP"
# #
# #   # default_action {
# #   #   type             = "forward"
# #   #   target_group_arn = aws_lb_target_group.front_end.arn
# #   # }
# # }
