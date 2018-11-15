FROM node:alpine as npmbuild

WORKDIR /usr/app/

COPY package.json ./
RUN npm install
COPY ./ ./

CMD ["npm", "run", "start"]

FROM nginx
COPY --from=npmbuild /usr/app/build /usr/share/nginx/html