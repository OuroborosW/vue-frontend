# 使用官方的 Node.js 作为基础镜像
FROM node:16 as build-stage

# 设置工作目录
WORKDIR /app

# 复制 package.json 和 package-lock.json，然后安装依赖项
COPY package*.json ./
RUN npm install

# 复制源代码和其他文件到工作目录
COPY . .

# 构建应用
RUN npm run build

# 使用 nginx 容器为生产环境提供服务
FROM nginx:stable-alpine as production-stage

# 将从 build 阶段构建的文件复制到 nginx 容器的 appropriate 目录中
COPY --from=build-stage /app/dist /usr/share/nginx/html

# 为80端口提供服务
EXPOSE 8080

# 当容器启动时，运行 nginx
CMD ["nginx", "-g", "daemon off;"]
