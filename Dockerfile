FROM node:8-alpine
RUN  mkdir /app 
WORKDIR /app
COPY . /app/
EXPOSE 80
RUN  npm config set registry http://mirrors.cloud.tencent.com/npm/ && npm install && npm run build
CMD ["npm","run","dev"]