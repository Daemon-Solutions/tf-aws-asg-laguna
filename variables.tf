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

variable "availability_zones" {
  description = "A list of Available Zones IDs to launch resources in"
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
  type    = string  
}

variable "https_port" {
  type    = string  
  default = "443"
}

variable "alb_certificate_arn" {
  type    = string    
}

variable "alb_listener_protocol" {
  type    = string      
}

variable "alb_target_protocol" {
  type    = string        
}

variable "alb_target_port" {
  type    = string        
}