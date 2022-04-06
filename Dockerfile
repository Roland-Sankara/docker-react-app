FROM node:14.19-alpine
# creating a system user with less priviledges
RUN addgroup app && adduser -S -G app app
# setting the default user
USER app
WORKDIR /app
COPY package*.json .
RUN npm install
COPY . .
ENV API_URL=http://api.myapp.com
EXPOSE 3000
CMD ["npm", "start"]