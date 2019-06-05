FROM node:alpine as builder

WORKDIR '/app'

COPY ./package.json ./

RUN npm install

COPY . .

RUN npm run build

# check lesson 128 that explains why this project has two nginx images. This one is just for serving the frontend assets
# the other one in the nginx folder is for routing between the client and the server
FROM nginx

# EBS reads this and creates the mapping when starts the container
EXPOSE 3000

COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf

COPY --from=builder /app/build /usr/share/nginx/html