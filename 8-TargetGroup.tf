resource "aws_lb_target_group" "Australia_tg" {
  name        = "Australia-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.Australia_VPC.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "AustraliaTargetGroup"
    Service = "Australia"
    Owner   = "User"
    Project = "Web_Service"
  }
}
