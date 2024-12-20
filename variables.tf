// Global Configuration
variable "name" {
}

variable "envname" {
}

variable "service" {
}

// Launch Configuration Variables
variable "ami_id" {
}

variable "instance_type" {
  default = "t2.micro"
}

variable "iam_instance_profile" {
}

variable "key_name" {
}

variable "security_groups" {
}

variable "user_data" {
  description = "Content of userdata file"
}

variable "associate_public_ip_address" {
  default = false
}

variable "detailed_monitoring" {
  default = false
}

// Auto-Scaling Group
variable "subnets" {
  description = "A list of subnet IDs to launch resources in"
}

variable "public_subnets" {
  description = "A list of Public subnet IDs to launch resources in"
}

variable "asg_min" {
  default = 0
}

variable "asg_max" {
  default = 1
}

variable "health_check_type" {
  default = "EC2"
}

variable "health_check_grace_period" {
  default = 300
}

variable "enabled_metrics" {
  description = "A list of metrics to collect. The allowed values are GroupMinSize, GroupMaxSize, GroupDesiredCapacity, GroupInServiceInstances, GroupPendingInstances, GroupStandbyInstances, GroupTerminatingInstances, GroupTotalInstances"
  type        = list(string)

  default = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupPendingInstances",
    "GroupStandbyInstances",
    "GroupTerminatingInstances",
    "GroupTotalInstances",
  ]
}

#ALB
variable "vpc_id" {
  type = string
}

variable "alb_health_path" {
  type    = string
  default = "/"
}

variable "alb_health_port" {
  type    = string
  default = "80"
}

variable "alb_logs_bucket" {
  description = "The bucket to store the logs"
  type        = string
}

variable "alb_logs_bucket_prefix" {
  description = "The S3 bucket prefix of where the alb logs are stored"
  type        = string
  default     = "alb-logs"
}

variable "https_port" {
  type    = string
  default = "443"
}

variable "alb_certificate_arn" {
  type = string
}

variable "alb_listener_protocol" {
  type = string
}

variable "alb_target_protocol" {
  type = string
}

variable "alb_target_port" {
  type = string
}

variable "suspended_processes" {
  type = list(string)
  default = [
    "HealthCheck",
    "Launch",
    "ReplaceUnhealthy",
    "Terminate"
  ]
}

variable "ssl_policy" {
  type    = string
  default = "ELBSecurityPolicy-TLS-1-2-2017-01"
}

variable "alb_internal_port" {
  type = string
}

variable "alb_internal_target_protocol" {
  type    = string
  default = "TCP"
}

variable "alb_int_enabled" {
  type    = string
  default = false
}

variable "stickiness_type" {
  type    = string
  default = "lb_cookie"
}

#SD-3205
variable "module_enabled" {
  type    = bool
  default = false
}


#SD-3772
variable "ebs_block_device" {
  description = "Specify volumes to attach to the instance besides the volumes specified by the AMI"
  type        = list(any)
  default     = []
}

variable "full_name" {
  description = "Full name of the resource (as opposed to prefix), in order to retain laguna compatibility"
  type        = string
  default     = null
}

variable "update_default_version" {
  description = "Update Default Template Version"
  type        = bool
  default     = true
}

