variable "vpc_id" { type = string }
variable "alb_public_subnets" { type = list(any) }
variable "alb_public_sg" { type = list(any) }
