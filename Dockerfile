FROM node:18-alpine3.18
# Update and upgrade all packages
RUN apk update && apk upgrade
# Explicitly install the latest versions of busybox and openssl
RUN apk add --no-cache busybox>=1.36.1-r7 openssl>=3.1.6-r0
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
COPY public ./public
EXPOSE 8080
CMD ["node", "index.js"]
