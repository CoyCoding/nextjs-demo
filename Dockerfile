FROM nginx:stable-alpine as nginx-img
COPY nginx/master.conf /etc/nginx/conf.d/default.conf
WORKDIR /


FROM node:current-alpine as base
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .


FROM base AS build
ENV NODE_ENV=production
WORKDIR /build
COPY --from=base /app ./
RUN npm run build


FROM node:current-alpine AS production
ENV NODE_ENV=production
WORKDIR /
COPY --from=build /build/package*.json ./
COPY --from=build /build/.next ./.next
COPY --from=build /build/public ./public
RUN npm install next

EXPOSE 3000

ENTRYPOINT [ "npm"]
CMD ["run","start"]