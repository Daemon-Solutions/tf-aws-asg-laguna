# tf-aws-asg-laguna

## Terraform version compatibility

| Module version    | Terraform version |
|-------------------|-------------------|
| 1.x.x             | 0.12.x            |
| 0.x.x             | 0.11.x            |

Upgrading from 0.11.x and earlier to 0.12.x should be seamless.  You can simply update the `ref` in your `source` to point to a version greater than `4.0.0`.

When first applied in 0.12.x, some policies may update due to the slight difference in format that occurs when moving from inline JSON to `aws_iam_policy_document`, however the policy permissions granted remain the same.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.31 |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_attachment.wordpress_autoscaling_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_attachment) | resource |
| [aws_autoscaling_group.asg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_launch_template.lt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_lb.alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb.alb_internal](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.alb_https_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.alb_internal_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener_certificate.alb_listener_acm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_certificate) | resource |
| [aws_lb_target_group.alb_https_target_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group.alb_internal_listener_target_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_certificate_arn"></a> [alb\_certificate\_arn](#input\_alb\_certificate\_arn) | n/a | `string` | n/a | yes |
| <a name="input_alb_health_path"></a> [alb\_health\_path](#input\_alb\_health\_path) | n/a | `string` | `"/"` | no |
| <a name="input_alb_health_port"></a> [alb\_health\_port](#input\_alb\_health\_port) | n/a | `string` | `"80"` | no |
| <a name="input_alb_int_enabled"></a> [alb\_int\_enabled](#input\_alb\_int\_enabled) | n/a | `string` | `false` | no |
| <a name="input_alb_internal_port"></a> [alb\_internal\_port](#input\_alb\_internal\_port) | n/a | `string` | n/a | yes |
| <a name="input_alb_internal_target_protocol"></a> [alb\_internal\_target\_protocol](#input\_alb\_internal\_target\_protocol) | n/a | `string` | `"TCP"` | no |
| <a name="input_alb_listener_protocol"></a> [alb\_listener\_protocol](#input\_alb\_listener\_protocol) | n/a | `string` | n/a | yes |
| <a name="input_alb_logs_bucket"></a> [alb\_logs\_bucket](#input\_alb\_logs\_bucket) | The bucket to store the logs | `string` | n/a | yes |
| <a name="input_alb_logs_bucket_prefix"></a> [alb\_logs\_bucket\_prefix](#input\_alb\_logs\_bucket\_prefix) | The S3 bucket prefix of where the alb logs are stored | `string` | `"alb-logs"` | no |
| <a name="input_alb_target_port"></a> [alb\_target\_port](#input\_alb\_target\_port) | n/a | `string` | n/a | yes |
| <a name="input_alb_target_protocol"></a> [alb\_target\_protocol](#input\_alb\_target\_protocol) | n/a | `string` | n/a | yes |
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | Launch Configuration Variables | `any` | n/a | yes |
| <a name="input_asg_max"></a> [asg\_max](#input\_asg\_max) | n/a | `number` | `1` | no |
| <a name="input_asg_min"></a> [asg\_min](#input\_asg\_min) | n/a | `number` | `0` | no |
| <a name="input_associate_public_ip_address"></a> [associate\_public\_ip\_address](#input\_associate\_public\_ip\_address) | n/a | `bool` | `false` | no |
| <a name="input_detailed_monitoring"></a> [detailed\_monitoring](#input\_detailed\_monitoring) | n/a | `bool` | `false` | no |
| <a name="input_ebs_block_device"></a> [ebs\_block\_device](#input\_ebs\_block\_device) | Specify volumes to attach to the instance besides the volumes specified by the AMI | `list(any)` | `[]` | no |
| <a name="input_enabled_metrics"></a> [enabled\_metrics](#input\_enabled\_metrics) | A list of metrics to collect. The allowed values are GroupMinSize, GroupMaxSize, GroupDesiredCapacity, GroupInServiceInstances, GroupPendingInstances, GroupStandbyInstances, GroupTerminatingInstances, GroupTotalInstances | `list(string)` | <pre>[<br>  "GroupMinSize",<br>  "GroupMaxSize",<br>  "GroupDesiredCapacity",<br>  "GroupInServiceInstances",<br>  "GroupPendingInstances",<br>  "GroupStandbyInstances",<br>  "GroupTerminatingInstances",<br>  "GroupTotalInstances"<br>]</pre> | no |
| <a name="input_envname"></a> [envname](#input\_envname) | n/a | `any` | n/a | yes |
| <a name="input_full_name"></a> [full\_name](#input\_full\_name) | Full name of the resource (as opposed to prefix), in order to retain laguna compatibility | `string` | `null` | no |
| <a name="input_health_check_grace_period"></a> [health\_check\_grace\_period](#input\_health\_check\_grace\_period) | n/a | `number` | `300` | no |
| <a name="input_health_check_type"></a> [health\_check\_type](#input\_health\_check\_type) | n/a | `string` | `"EC2"` | no |
| <a name="input_https_port"></a> [https\_port](#input\_https\_port) | n/a | `string` | `"443"` | no |
| <a name="input_iam_instance_profile"></a> [iam\_instance\_profile](#input\_iam\_instance\_profile) | n/a | `any` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | n/a | `string` | `"t2.micro"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | n/a | `any` | n/a | yes |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | SD-3205 | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Global Configuration | `any` | n/a | yes |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | A list of Public subnet IDs to launch resources in | `any` | n/a | yes |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | n/a | `any` | n/a | yes |
| <a name="input_service"></a> [service](#input\_service) | n/a | `any` | n/a | yes |
| <a name="input_ssl_policy"></a> [ssl\_policy](#input\_ssl\_policy) | n/a | `string` | `"ELBSecurityPolicy-TLS-1-2-2017-01"` | no |
| <a name="input_stickiness_type"></a> [stickiness\_type](#input\_stickiness\_type) | n/a | `string` | `"lb_cookie"` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | A list of subnet IDs to launch resources in | `any` | n/a | yes |
| <a name="input_suspended_processes"></a> [suspended\_processes](#input\_suspended\_processes) | n/a | `list(string)` | <pre>[<br>  "HealthCheck",<br>  "Launch",<br>  "ReplaceUnhealthy",<br>  "Terminate"<br>]</pre> | no |
| <a name="input_update_default_version"></a> [update\_default\_version](#input\_update\_default\_version) | Update Default Template Version | `bool` | `true` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | Content of userdata file | `any` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ALB | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_asg_id"></a> [asg\_id](#output\_asg\_id) | n/a |
| <a name="output_asg_name"></a> [asg\_name](#output\_asg\_name) | n/a |
| <a name="output_aws_lb_alb_dns_name"></a> [aws\_lb\_alb\_dns\_name](#output\_aws\_lb\_alb\_dns\_name) | n/a |
| <a name="output_aws_lb_alb_internal_dns_name"></a> [aws\_lb\_alb\_internal\_dns\_name](#output\_aws\_lb\_alb\_internal\_dns\_name) | n/a |
| <a name="output_launch_config_id"></a> [launch\_config\_id](#output\_launch\_config\_id) | n/a |
<!-- END_TF_DOCS -->