FROM node:14-alpine AS build
WORKDIR /app
COPY / ./
COPY package.json ./
COPY yarn.lock ./

RUN yarn install && \
    npm run build
COPY . .

FROM nginx:1.20-alpine
WORKDIR /app
COPY --from=build /app/dist/lux-frontend /usr/share/nginx/html