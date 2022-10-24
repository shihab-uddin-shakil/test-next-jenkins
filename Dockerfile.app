FROM node:16.16.0-alpine as build
#create wroking directory
RUN mkdir -p /var/www/frontend

# Set working directory
WORKDIR /var/www/frontend
#copy code from base directory
COPY . /var/www/frontend


RUN rm -Rf node_modules

RUN yarn 

FROM node:16.16.0-alpine

#code copy from build
COPY --from=build /var/www/frontend /

CMD ["yarn","dev"]
