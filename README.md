#### 1. Install Docker

https://www.docker.com/community-edition#/download


#### 2. Build container

`$ docker build -t friendlyname .`


#### 3. Run container locally, mapping container's port 4567 to localhost:4000

`$ docker run -p 4000:4567 friendlyname`


#### 4. Test locally

http://localhost:4000


#### 5. Create Heroku app

`$ heroku create`


#### 6. Login to Heroku's container registry

`$ heroku container:login`


#### 7. Push to Heroku's container registry

`$ heroku container:push web`


#### 8. View on Heroku

`$ heroku open`


#### More info

https://devcenter.heroku.com/articles/container-registry-and-runtime
