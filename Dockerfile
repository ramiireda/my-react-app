FROM node:latest AS build
WORKDIR /app
COPY package.json ./

RUN npm config rm proxy
RUN npm config rm proxy --global
RUN npm config rm https-proxy
RUN npm config rm https-proxy --global
RUN npm config rm registry
RUN npm config set registry http://registry.npmjs.org
RUN npm config set strict-ssl false


RUN yarn install
COPY . .
RUN npm run build

FROM nginx:1.17.1-alpine
COPY --from=build /app/build/ /usr/share/nginx/html/
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d

EXPOSE 8888
CMD ["nginx","-g","daemon off;"]
