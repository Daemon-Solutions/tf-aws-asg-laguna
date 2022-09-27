output "launch_config_id" {
  value = aws_launch_configuration.lc.id
}

output "asg_id" {
  value = aws_autoscaling_group.asg.id
}

output "asg_name" {
  value = aws_autoscaling_group.asg.name
}

output "aws_lb_alb_dns_name" {
  value = aws_lb.alb.dns_name
}

output "aws_lb_alb_internal_dns_name" {
  value = try(aws_lb.alb_internal[0].dns_name, 0)
}

