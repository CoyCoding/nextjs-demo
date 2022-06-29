FROM nginx:stable-alpine
COPY dev.conf /etc/nginx/conf.d/default.conf
WORKDIR /

FROM node:current-alpine as install
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install

FROM node:current-alpine as develop
WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
COPY . ./
COPY --from=install /app/node_modules ./node_modules
EXPOSE 3000
ENTRYPOINT ["npm"]
CMD ["run", "dev"]