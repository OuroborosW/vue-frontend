# 使用官方的Node.js镜像作为基础镜像
FROM node:14

# 设置工作目录
WORKDIR /app

# 复制前端代码到容器中
COPY . .

# 安装依赖
RUN npm install

# 构建前端应用
RUN npm run build

# 暴露应用运行的端口
EXPOSE 80

# 启动应用
CMD ["npm", "start"]
