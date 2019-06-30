FROM node:alpine

WORKDIR '/app'

# Download and install a dependency
COPY package.json .
RUN npm install
COPY . .

CMD npm run start