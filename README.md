🇺🇸 [English](README.md) | 🇧🇷 [Português](README.pt-BR.md)

# AWS Infrastructure Setup with Terraform – Scheduled EC2 Instance Type Change

This repository contains Terraform files that provision an AWS Lambda function, an IAM policy, an IAM role, and an EventBridge rule used to modify EC2 instances.

## What It Does

On a schedule defined by an EventBridge rule, the Lambda function (Node.js, `lambda_function.js`):

1. Stops the target EC2 instance.
2. Waits until the instance is fully stopped.
3. Changes the instance type.
4. Starts the instance again.

The instance region, instance ID, and target instance type are passed to the function in the EventBridge event input.

## File Structure

- `provider.tf`: Configures the AWS provider and region.
- `iam_policy.tf`: Defines the IAM policy with the required permissions.
- `iam_role.tf`: Creates the IAM role and attaches the policy.
- `lambda_function.tf`: Configures the Lambda function with its code and environment variables.
- `eventbridge.tf`: Defines the EventBridge rule that triggers the Lambda function.
- `lambda_function.js`: Lambda function source code.

## How to Use This Repository

### Clone the Repository

To use this repository, clone the project to your local environment:

```bash
git clone https://github.com/Luiz-Xayk/terraform-modify-ec2.git
cd terraform-modify-ec2
```

### Edit the Variables

Before applying the Terraform configuration, edit the `.tf` files as needed, especially to set values such as the EC2 instance region, instance ID, and instance type:

- In `lambda_function.tf`, replace the values of `INSTANCE_REGION`, `INSTANCE_ID`, and `INSTANCE_TYPE` with your actual EC2 instance values, or turn them into Terraform variables.
- In `eventbridge.tf`, replace the placeholders in the target `input` (`instanceRegion`, `instanceId`, `instanceType`) and adjust the `cron(...)` schedule expression as desired.
