resource "aws_lb" "alb" {
  name                       = "${var.name}-alb"
  internal                   = false
  subnets                    = split(",", var.public_subnets)
  security_groups            = split(",", var.security_groups)
  load_balancer_type         = "application"
  enable_deletion_protection = true
  access_logs {
    bucket  = var.alb_logs_bucket
    prefix  = "alb-logs"
    enabled = true
  }
  tags = {
    Name = "${var.name}-alb-${var.envname}"
  }
}
#ALB listner
resource "aws_lb_listener" "alb_https_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = var.https_port
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
  certificate_arn   = var.alb_certificate_arn
  default_action {
    target_group_arn = aws_lb_target_group.alb_https_target_group.arn
    type             = "forward"
  }
}

resource "aws_lb_listener_certificate" "alb_listener_acm" {
  listener_arn    = aws_lb_listener.alb_https_listener.arn
  certificate_arn = var.alb_certificate_arn
}

resource "aws_lb_target_group" "alb_https_target_group" {
  name     = "${var.name}-target"
  port     = var.alb_target_port
  protocol = var.alb_target_protocol
  vpc_id   = var.vpc_id

  tags = {
    Name    = "${var.name}-alb-http-target-group"
    envname = var.envname
  }
  #The below is a bug with TFv0.12.24/25. You need to set stickiness as enable = true
  stickiness {
    type            = "lb_cookie"
    cookie_duration = 1800
    enabled         = false
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    path                = var.alb_health_path
    port                = var.alb_health_port
  }
}


# Autoscaling Target Group attachment
resource "aws_autoscaling_attachment" "wordpress_autoscaling_attachment" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  alb_target_group_arn   = aws_lb_target_group.alb_https_target_group.arn
}
