resource "aws_lb" "Australia_alb" {
  name               = "Australia-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.Australia-sg02-LB01.id]
  subnets = [
    aws_subnet.public-ap-southeast-2a.id,
    aws_subnet.public-ap-southeast-2b.id,
    aws_subnet.public-ap-southeast-2c.id
  ]
  enable_deletion_protection = false
  #Lots of death and suffering here, make sure it's false

  tags = {
    Name    = "AustraliaLoadBalancer"
    Service = "Australia"
    Owner   = "User"
    Project = "Web Service"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.Australia_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.Australia_tg.arn
  }
}


output "lb_dns_name" {
  value       = aws_lb.Australia_alb.dns_name
  description = "The DNS name of the Australia Load Balancer."
}
