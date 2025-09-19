# Dockerfile (use node 20 slim for small image)
FROM node:20-alpine

# create app directory
WORKDIR /app

# copy package manifests first for better caching
COPY package*.json ./

# install production deps only
RUN npm ci --production

# copy source
COPY . .

EXPOSE 3000
HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 \
  CMD wget -qO- --timeout=2 http://localhost:3000/health || exit 1

CMD ["node", "src/index.js"]
