FROM node:12.16.3-alpine3.9


RUN adduser -D user
WORKDIR /home/user

COPY package*.json ./
RUN npm install

COPY . .

RUN npm run dev

EXPOSE 3000

ENV NUXT_HOST=0.0.0.0

ENV NUXT_PORT=3000

USER user

CMD [ "npm", "start" ]
