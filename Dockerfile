# 使用 Node.js 作为基础镜像
FROM node:14

# 设置工作目录
WORKDIR /app

# 复制前端项目文件到工作目录
COPY . .

# 安装依赖
RUN npm install

# 构建前端应用
RUN npm run build

# 暴露端口（根据你的前端应用端口进行设置）
EXPOSE 8080

# 启动前端应用
CMD ["npm", "run", "serve"]
