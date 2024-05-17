# build phase
FROM node:current-alpine3.18 as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

# run phase
FROM nginx as runner
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html    