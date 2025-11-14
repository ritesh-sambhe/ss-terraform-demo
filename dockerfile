FROM nginx:alpine

# Install curl for health checks (required by ECS health check command)
RUN apk add --no-cache curl

# Create a simple demo HTML page
RUN echo '<!DOCTYPE html>\
<html>\
<head>\
    <title>AMS SS Production - Test Deployment</title>\
    <style>\
        body { font-family: Arial, sans-serif; text-align: center; padding: 50px; background: #f0f0f0; }\
        .container { background: white; padding: 30px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }\
        h1 { color: #2c3e50; }\
        .status { color: #27ae60; font-size: 18px; margin-top: 20px; }\
        .info { color: #7f8c8d; margin-top: 15px; }\
    </style>\
</head>\
<body>\
    <div class="container">\
        <h1>🚀 AMS SS Production Infrastructure</h1>\
        <div class="status">✅ Deployment Successful!</div>\
        <div class="info">This is a test deployment to verify Terraform infrastructure.</div>\
        <div class="info">Container: app | Port: 80 | Status: Healthy</div>\
    </div>\
</body>\
</html>' > /usr/share/nginx/html/index.html

# Expose port 80 (matches terraform.tfvars container_port = 80)
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
