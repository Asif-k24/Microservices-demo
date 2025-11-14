#!/bin/bash
# User data script for EC2 instance
yum update -y
yum install -y docker

# Start Docker service
systemctl start docker
systemctl enable docker

# Install Docker Compose
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Create application directory
mkdir -p /opt/microservices
cd /opt/microservices

# Pull your microservices (replace with your actual images)
docker pull your-account-service:latest
docker pull your-order-service:latest
docker pull your-product-service:latest

# Create docker-compose file
cat << EOF > docker-compose.yml
version: '3.8'
services:
  account-service:
    image: your-account-service:latest
    ports:
      - "8080:8080"
    environment:
      - DB_HOST=${db_host}
      - DB_NAME=${db_name}
      - DB_USERNAME=${db_username}
      - DB_PASSWORD=${db_password}

  order-service:
    image: your-order-service:latest
    ports:
      - "8081:8080"
    environment:
      - DB_HOST=${db_host}
      - DB_NAME=${db_name}

  product-service:
    image: your-product-service:latest
    ports:
      - "8082:8080"
EOF

# Start services
docker-compose up -d

# Install CloudWatch agent for monitoring
yum install -y amazon-cloudwatch-agent