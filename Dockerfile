# stage 1
FROM node:latest as node
WORKDIR /firstdevops
COPY . .
RUN npm install
RUN npm run build --prod

# stage 2
FROM nginx:alpine
COPY --from=node /firstdevops/dist/firstdevops /usr/share/nginx/html