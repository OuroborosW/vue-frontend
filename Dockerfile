# 1. 使用 Node.js 镜像构建前端资源
FROM node:16 AS build-stage

WORKDIR /app

# 安装项目依赖
COPY package*.json ./
RUN npm install

# 复制并构建项目
COPY . .
RUN npm run build

# 2. 使用 Nginx 镜像托管前端资源
FROM nginx:stable-alpine as production-stage

# 将构建的文件从构建阶段复制到 Nginx
COPY --from=build-stage /app/dist /usr/share/nginx/html

# 暴露 80 端口
EXPOSE 80

# 用 Nginx 以默认配置启动
CMD ["nginx", "-g", "daemon off;"]
