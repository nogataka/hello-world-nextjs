# ---- Build Stage ----
FROM node:18-alpine AS builder

WORKDIR /app

# 依存関係のインストール
COPY package.json package-lock.json* ./
RUN npm install

# アプリの全ファイルをコピー
COPY . .

# ビルド（next exportは不要）
RUN npm run build

# ---- Production Stage ----
FROM node:18-alpine

WORKDIR /app

# 静的ファイルのみコピー
COPY --from=builder /app/out ./out

# 静的ファイル用のHTTPサーバーをインストール
RUN npm install -g serve

# ポート開放と環境変数
EXPOSE 80
ENV PORT=80

# アプリを起動
CMD ["serve", "-s", "out"]
