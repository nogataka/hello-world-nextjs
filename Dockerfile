# Step 1: Build Stage
FROM node:20-alpine AS builder
WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# Step 2: Run Stage
FROM node:20-alpine
WORKDIR /app

COPY --from=builder /app ./
RUN npm install --production

ENV PORT=3000
EXPOSE 3000

CMD ["npm", "start"]

