FROM node:8-alpine
RUN apk update  && apk add nginx && mkdir /app && mkdir -p /run/nginx
WORKDIR /app
COPY . /app/
EXPOSE 80
RUN  npm config set registry http://mirrors.cloud.tencent.com/npm/ && npm install && npm run build  && cp nginx.conf /etc/nginx/nginx.conf
CMD ["nginx","-g","daemon off;"]