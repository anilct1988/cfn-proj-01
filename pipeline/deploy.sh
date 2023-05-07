#!/bin/bash

# Variables
STACK_NAME="my-ec2-stack"
TEMPLATE_FILE="pipeline/ec2.yml"
#PARAMETERS_FILE="my-parameters.json"
AWS_REGION="ap-southeast-2"
INSTANCE_TYPE="t2.micro"
#KEY_NAME="my-keypair"

# Create the CloudFormation stack
aws cloudformation create-stack \
  --stack-name $STACK_NAME \
  --template-body file://$TEMPLATE_FILE \
  --region $AWS_REGION

# Wait for stack creation to complete
# aws cloudformation wait stack-create-complete \
#   --stack-name $STACK_NAME \
#   --region $AWS_REGION

# # Get the instance ID from the stack outputs
# INSTANCE_ID=$(aws cloudformation describe-stacks \
#   --stack-name $STACK_NAME \
#   --query "Stacks[0].Outputs[?OutputKey=='InstanceId'].OutputValue" \
#   --output text \
#   --region $AWS_REGION)

# # Wait for the instance to be running
# aws ec2 wait instance-running \
#   --instance-ids $INSTANCE_ID \
#   --region $AWS_REGION

# # Get the public DNS name of the instance
# PUBLIC_DNS=$(aws ec2 describe-instances \
#   --instance-ids $INSTANCE_ID \
#   --query "Reservations[0].Instances[0].PublicDnsName" \
#   --output text \
#   --region $AWS_REGION)

# # SSH into the instance and run a command
# #ssh -i ~/.ssh/$KEY_NAME.pem ec2-user@$PUBLIC_DNS "ls -la"
