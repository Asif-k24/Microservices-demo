#!/bin/bash

# Apply IAM policies for Microservices Demo (EC2 Version)
set -e

echo "Applying IAM policies for Microservices Demo..."

# Create EC2 Instance Role
aws iam create-role \
    --role-name MicroservicesEC2InstanceRole \
    --assume-role-policy-document '{
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Principal": {
                    "Service": "ec2.amazonaws.com"
                },
                "Action": "sts:AssumeRole"
            }
        ]
    }' || echo "Role may already exist"

# Attach EC2 instance policy
aws iam put-role-policy \
    --role-name MicroservicesEC2InstanceRole \
    --policy-name MicroservicesEC2InstancePolicy \
    --policy-document file://iam-policies/ec2-instance-role-policy.json

# Attach CloudWatch policy
aws iam put-role-policy \
    --role-name MicroservicesEC2InstanceRole \
    --policy-name MicroservicesCloudWatchPolicy \
    --policy-document file://iam-policies/cloudwatch-policy.json

# Attach AWS managed policies
aws iam attach-role-policy \
    --role-name MicroservicesEC2InstanceRole \
    --policy-arn arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore

# Create instance profile
aws iam create-instance-profile \
    --instance-profile-name MicroservicesEC2InstanceProfile || echo "Instance profile may already exist"

aws iam add-role-to-instance-profile \
    --instance-profile-name MicroservicesEC2InstanceProfile \
    --role-name MicroservicesEC2InstanceRole

echo "IAM policies applied successfully!"
echo "EC2 Instance Role: MicroservicesEC2InstanceRole"
echo "Instance Profile: MicroservicesEC2InstanceProfile"