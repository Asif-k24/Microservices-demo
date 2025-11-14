output "ec2_instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.web.id
}

output "rds_endpoint" {
  description = "RDS Endpoint"
  value       = aws_db_instance.mydb.address
  sensitive   = true
}

output "ec2_public_ip" {
  description = "EC2 Public IP"
  value       = aws_instance.web.public_ip
}

output "iam_role_arn" {
  description = "IAM Role ARN for EC2"
  value       = aws_iam_role.ec2_instance_role.arn
}