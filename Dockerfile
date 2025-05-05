# ---- Build Stage ----
FROM node:18-alpine AS builder

WORKDIR /app

COPY package.json package-lock.json* ./
RUN npm install

COPY . .

# Static HTML を生成
RUN npm run build && npx next export

# ---- Serve Stage ----
FROM node:18-alpine

WORKDIR /app

# 静的ファイルだけコピー
COPY --from=builder /app/out ./out

RUN npm install -g serve

EXPOSE 3000
ENV PORT=3000

# `serve` を使って静的ファイルをホスティング
CMD ["serve", "-s", "out", "-l", "3000"]
