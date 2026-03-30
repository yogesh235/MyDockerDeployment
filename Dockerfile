FROM node:24-alpine AS Build
WORKDIR /app
COPY package.json /app/
RUN npm install
COPY . /app/
CMD ["npm", "run", "dev"]

FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY --from=Build /app/dist/ /usr/share/nginx/html
EXPOSE 80