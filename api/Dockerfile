FROM node:14-alpine AS builder
WORKDIR /app
COPY package*.json ./
COPY yarn.lock ./
RUN yarn install
COPY . .
RUN npm run build

FROM node:14-alpine AS server
WORKDIR /app
COPY package* ./
COPY yarn.lock ./
COPY ormconfig.js ./
RUN yarn install --production
COPY --from=builder ./app/dist ./dist
EXPOSE 3000
CMD ["npm", "start"]