
FROM node:14.21.0 AS build

WORKDIR /app

COPY . .

RUN npm install

RUN npm run build

# Serve Application using Nginx Server
FROM nginx:alpine
COPY --from=build /app/dist/crudtuto-Front /usr/share/nginx/html


