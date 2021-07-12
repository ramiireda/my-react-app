FROM nginx:1.17.1-alpine
COPY build/ /usr/share/nginx/html/
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d

EXPOSE 8888
CMD ["nginx","-g","daemon off;"]
#fdf
