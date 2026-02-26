# Reduced the image size by using a smaller base image (alpine)
FROM node:20.17-alpine3.19

#Always copy the static files first to leverage Docker's layer caching for static assets

# Optimized layer caching by installing dependencies before copying the application code
WORKDIR /home/app/

# Copying package-lock.json before package.json to leverage Docker's layer caching for npm install
COPY package-lock.json package-lock.json
COPY package.json package.json
RUN npm install

# Copying only the necessary files for the application to reduce the image size and improve build times
COPY index.js server.js

CMD ["npm", "start"]
