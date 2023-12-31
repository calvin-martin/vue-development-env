FROM node:20-alpine3.17 AS build
WORKDIR VUEAPP
COPY . .
RUN npm ci
FROM build AS development
EXPOSE 8080
RUN apk update \
    && apk add git
CMD ["npm", "run", "serve"]