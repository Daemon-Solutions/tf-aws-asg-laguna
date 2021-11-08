# tf-aws-asg-laguna

## Terraform version compatibility

| Module version    | Terraform version |
|-------------------|-------------------|
| 1.x.x             | 0.12.x            |
| 0.x.x             | 0.11.x            |

Upgrading from 0.11.x and earlier to 0.12.x should be seamless.  You can simply update the `ref` in your `source` to point to a version greater than `4.0.0`.

When first applied in 0.12.x, some policies may update due to the slight difference in format that occurs when moving from inline JSON to `aws_iam_policy_document`, however the policy permissions granted remain the same.
