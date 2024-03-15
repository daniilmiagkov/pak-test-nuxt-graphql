## Используем официальный образ Node.js версии 18
## Надо будет протестировать этот образ https://hub.docker.com/r/bitnami/node/
#FROM node:18-alpine
#
## Устанавливаем рабочую директорию внутри контейнера
#WORKDIR /app
#
## Создаем пользователя 'user' и устанавливаем его владельцем рабочей директории
##RUN adduser -D user
#
## Копируем package.json и package-lock.json для установки зависимостей
#COPY package*.json ./
#
## Переключаемся на пользователя 'user'
##USER user
#
## Устанавливаем зависимости
#RUN npm install
#
## Копируем все файлы проекта внутрь контейнера
#COPY . .
#
## Указываем порт, который будет использоваться приложением
#EXPOSE 3000
#
## Команда, которая будет запускаться при запуске контейнера
#CMD ["npm", "run", "dev"]
# base
FROM node:18-alpine AS builder

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM node:18-alpine

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install --only=production

#COPY --from=builder /usr/src/app/dist ./
COPY --from=builder /usr/src/app/.output ./.output

EXPOSE 3000
CMD ["ls"]
#ENTRYPOINT ["node","./app.js"]
#CMD ["npm","start"]
CMD ["node",".output/server/index.mjs"]