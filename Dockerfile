FROM node:20-alpine AS build
ENV NODE_ENV=production

RUN npm install -g bun pm2

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["pm2-runtime", "start", "app.ts"]
