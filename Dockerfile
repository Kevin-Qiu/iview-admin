FROM node:8-alpine
RUN apk update  && apk add nginx && mkdir /app
WORKDIR /app
COPY . /app/
EXPOSE 80
RUN  npm config set registry http://mirrors.cloud.tencent.com/npm/ && npm install && npm run build  && cp -r dist/* /var/www/html && rm -rf /app
CMD ["nginx","-g","daemon off;"]