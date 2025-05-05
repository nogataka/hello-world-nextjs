FROM node:18

WORKDIR /usr/src/app
COPY . .

# 静的ファイル用に serve を使用
RUN npm install -g serve

CMD ["serve", "-s", "."]
