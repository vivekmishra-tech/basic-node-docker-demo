# Use a small stable Node image
FROM node:18-alpine

WORKDIR /app

# copy package first for better caching
COPY package*.json ./
RUN npm ci --only=production

# copy app
COPY . .

EXPOSE 3000
ENV NODE_ENV=production

CMD ["node", "src/index.js"]
