FROM node:14-alpine
WORKDIR /app
COPY . .
RUN echo 'console.log("Hello, World!");' > index.js
CMD ["node", "index.js"]
