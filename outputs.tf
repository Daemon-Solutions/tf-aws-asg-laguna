output "launch_config_id" {
  value = join("", aws_launch_template.lt.*.id)
}

output "asg_id" {
  value = try(aws_autoscaling_group.asg[0].id, 0)
}

output "asg_name" {
  value = try(aws_autoscaling_group.asg[0].name, 0)
}

output "aws_lb_alb_dns_name" {
  value = try(aws_lb.alb[0].dns_name, 0)
}

output "aws_lb_alb_internal_dns_name" {
  value = try(aws_lb.alb_internal[0].dns_name, 0)
}

