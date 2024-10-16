// Launch Configuration
resource "aws_launch_configuration" "lc" {
  count = var.module_enabled ? 1 : 0

  lifecycle {
    create_before_destroy = true
  }

  security_groups = split(",", var.security_groups)

  image_id                    = var.ami_id
  instance_type               = var.instance_type
  iam_instance_profile        = var.iam_instance_profile
  key_name                    = var.key_name
  user_data                   = var.user_data
  associate_public_ip_address = var.associate_public_ip_address
  enable_monitoring           = var.detailed_monitoring
}

locals {
  target_group_arns = var.alb_int_enabled ? [try(aws_lb_target_group.alb_https_target_group[0].arn, 0), aws_lb_target_group.alb_internal_listener_target_group[0].arn] : [try(aws_lb_target_group.alb_https_target_group[0].arn, 0)]
}

// Auto-Scaling Group Configuration
resource "aws_autoscaling_group" "asg" {
  count = var.module_enabled ? 1 : 0

  name = var.name

  vpc_zone_identifier = [element(split(",", var.subnets), "0")]

  target_group_arns = local.target_group_arns

  launch_configuration = aws_launch_configuration.lc[0].name

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

