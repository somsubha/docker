FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
#RUN mkdir -p node_modules/.cache && chmod -R 777 node_modules/.cache
COPY . . 
RUN npm run build

FROM nginx
EXPOSE 80
#/usr/share/nginx/html =  This comes fromy the nginx documentation
COPY --from=builder /app/build /usr/share/nginx/html