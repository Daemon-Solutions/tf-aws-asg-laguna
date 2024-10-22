locals {
  target_group_arns = var.alb_int_enabled ? compact([try(aws_lb_target_group.alb_https_target_group[0].arn, ""), try(aws_lb_target_group.alb_internal_listener_target_group[0].arn, "")]) : compact([try(aws_lb_target_group.alb_https_target_group[0].arn, "")])
}


// Auto-Scaling Group Configuration
resource "aws_autoscaling_group" "asg" {
  count = var.module_enabled ? 1 : 0

  name = var.name

  vpc_zone_identifier = [element(split(",", var.subnets), "0")]

  target_group_arns = local.target_group_arns

  launch_template {
    id      = aws_launch_template.lt[0].id
    version = "$Latest"
  }

  enabled_metrics = var.enabled_metrics

  min_size = var.asg_min
  max_size = var.asg_max

  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type

  suspended_processes = var.suspended_processes

  tag {
    key                 = "Name"
    value               = var.name
    propagate_at_launch = true
  }
  tag {
    key                 = "Environment"
    value               = var.envname
    propagate_at_launch = true
  }
  tag {
    key                 = "Service"
    value               = var.service
    propagate_at_launch = true
  }
}

