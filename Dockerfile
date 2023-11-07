
FROM node:14.21.0 AS builder

WORKDIR /app
COPY . .
COPY package.json package-lock.json ./
RUN npm install
RUN npm run build --prod

FROM nginx:alpine
COPY nginx.conf  /etc/nginx/conf.d/default.conf
COPY --from=builder /app/dist/crudtuto-Front /usr/share/nginx/html
EXPOSE 88
CMD ["nginx", "-g", "daemon off;"]