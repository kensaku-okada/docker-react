# build phase
# all of the process underneath it is referred to as 'builder'
FROM node:alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .

# the output is 'build' folder
RUN npm run build


# run phase
FROM nginx
# copy over something from the other phase we are just working on
# source of destination path: https://hub.docker.com/_/nginx/
COPY --from=builder /app/build /usr/share/nginx/html

