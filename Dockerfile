FROM nginx:alpine

# Copy website content to nginx default root
COPY site /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
