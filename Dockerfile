# Production multi-stage Dockerfile for HassanPro Chat
FROM node:20-alpine AS builder

WORKDIR /app

# Install Bun to install dependencies from the committed bun.lock
RUN npm install -g bun

# Install dependencies
COPY package.json bun.lock ./
RUN bun install --frozen-lockfile

# Copy all source files
COPY . .

# Build Vite frontend
RUN npm run build

# Expose server port (default 3000)
EXPOSE 3000

ENV NODE_ENV=production
ENV PORT=3000

# Start full-stack server
CMD ["npm", "start"]
