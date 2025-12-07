# 1. Use a lean Node.js image
FROM node:25-alpine

# 2. Set the working directory inside the container
WORKDIR /usr/src/app

# 3. Copy the dependency file and install dependencies
COPY typescript/package.json ./
RUN npm install

COPY typescript/rename-ts.sh rename-ts.sh
RUN chmod +x rename-ts.sh

CMD ["npm", "run", "generate"]