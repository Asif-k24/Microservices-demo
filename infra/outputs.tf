output "ec2_public_ip" {
  value = aws_instance.web.public_ip
}

# Uncomment if you create ALB later
#output "alb_dns_name" {
#  value = aws_lb.web_alb.dns_name
#}

output "rds_endpoint" {
  value = aws_db_instance.mydb.endpoint
}