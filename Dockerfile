FROM nginx:alpine

COPY index.html /usr/share/nginx/html/
COPY image_23aaa9.png /usr/share/nginx/html/

# Expose port 80 (standard for HTTP)
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]