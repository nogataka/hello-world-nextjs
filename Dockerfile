# ---- Build Stage ----
FROM node:18-alpine AS builder

WORKDIR /app

# 依存関係のインストール
COPY package.json package-lock.json* ./
RUN npm install

# アプリの全ファイルをコピー
COPY . .

# ビルド＆静的ファイル出力
RUN npm run build && npx next export

# ---- Production Stage ----
FROM node:18-alpine

WORKDIR /app

# 静的ファイルのみコピー
COPY --from=builder /app/out ./out

# 静的ファイル用のHTTPサーバーをインストール
RUN npm install -g serve

# ポート開放と環境変数
EXPOSE 3000
ENV PORT=3000

# アプリを起動（CapRoverは $PORT を渡してくる）
CMD ["serve", "-s", "out", "-l", "3000"]
