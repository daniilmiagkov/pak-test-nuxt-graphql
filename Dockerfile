FROM node:20.11.1-alpine AS builder

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY assets ./assets
COPY components ./components
COPY public ./public
COPY server ./server
COPY utils ./utils
COPY app.vue ./
COPY nuxt.config.ts ./
COPY tsconfig.json ./


RUN npm run build

FROM node:20.11.1-alpine

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install --omit=dev

COPY --from=builder /usr/src/app/.output ./.output

EXPOSE 3000
CMD ["node",".output/server/index.mjs"]