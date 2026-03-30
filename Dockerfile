FROM node:24-alpine AS Build
WORKDIR /app
COPY package.json /app/
RUN npm install
COPY . /app/
RUN npm run build

FROM nginx
RUN rm -rf /usr/share/nginx/html/*
WORKDIR /app
COPY --from=Build /app /usr/share/nginx/html
EXPOSE 80