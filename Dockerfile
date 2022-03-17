FROM node:13-alpine 
WORKDIR '/app'
COPY package.json .
RUN npm config set registry http://registry.npmjs.org/
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.18-alpine
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html

