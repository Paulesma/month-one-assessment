#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd

TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
INSTANCE_ID=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/instance-id)

cat << EOT > /var/www/html/index.html
<!DOCTYPE html>
<html><head><title>TechCorp Web Server</title></head>
<body>
<h1>Welcome to TechCorp!</h1>
<p><strong>Instance ID:</strong> ${INSTANCE_ID}</p>
<p>High availability web server running on private subnet.</p>
</body></html>
EOT
