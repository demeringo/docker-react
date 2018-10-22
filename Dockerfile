FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# expose needed explicitly for elastic beanstalk to map the port
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
