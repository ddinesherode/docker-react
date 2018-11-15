FROM node:alpine as npmbuild

WORKDIR /usr/app/

COPY package.json ./
RUN npm install
COPY ./ ./

CMD ["npm", "run", "build"]

FROM nginx
EXPOSE 80
COPY --from=npmbuild /usr/app/build /usr/share/nginx/html