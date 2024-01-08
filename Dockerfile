# 2. For Nginx setup
#FROM nginx:alpine

# Copy config nginx
#COPY --from=build /app/.nginx/nginx.conf /etc/nginx/conf.d/default.conf
#COPY nginx.conf /etc/nginx/nginx.conf

# WORKDIR /usr/share/nginx/html

# # Remove default nginx static assets
# RUN rm -rf ./*

# Copy static assets from builder stage
#COPY --from=build /app/build .

# Containers run nginx with global directives and daemon off
#ENTRYPOINT ["nginx", "-g", "daemon off;"]


FROM nginx:alpine
COPY --from=build /app/.nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./default.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]