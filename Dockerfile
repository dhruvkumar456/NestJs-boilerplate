FROM node:18-alpine as builder
WORKDIR /opt/nestjs_boilerplate
RUN npm i -g @nestjs/cli
# output of 'echo npm' will become std input of 'nest new nestjs-docker'
RUN echo npm | nest new nestjs


FROM node:18-alpine as dev
WORKDIR /opt/nestjs-project
# After 'volumes - bind mount' these copy files get overwrite
# COPY --from=builder /opt/nestjs_boilerplate/nestjs ./
COPY package.json .
RUN npm install glob rimraf
RUN npm install --only=development
COPY . .
EXPOSE 3000
CMD npm run start:debug



FROM node:18-alpine as prod
ARG NODE_ENV=prod
ENV NODE_ENV=${NODE_ENV}
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install --production
COPY . .
COPY --from=dev /opt/nestjs-project/dist ./dist
CMD ["node", "dist/main"]