# ---- Step 1: Build the application ----
FROM node:18-alpine AS builder

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install

COPY . .
RUN npm run build

# ---- Step 2: Start the app using production image ----
FROM node:18-alpine

WORKDIR /app

# Copy only what's needed to run the app
COPY --from=builder /app ./

ENV NODE_ENV=production
ENV PORT=3000
EXPOSE 3000

CMD ["npm", "start"]
