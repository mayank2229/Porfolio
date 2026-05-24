# Use a specific, lightweight Nginx alpine image
FROM nginx:alpine

# Add Metadata
LABEL maintainer="Mayank Mishra <mayankmishra29280@gmail.com>"
LABEL description="DevOps Portfolio Website for Mayank Mishra"
LABEL version="1.0"

# Set working directory
WORKDIR /usr/share/nginx/html

# Remove default nginx static assets
RUN rm -rf ./*

# Copy local files to the container's workspace (excluding those in .dockerignore)
COPY . .

# Add a healthcheck to monitor the web server
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD wget -qO- http://localhost/ || exit 1

# Expose port 80 (standard for HTTP)
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]