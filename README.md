#### 1. Install Docker
https://www.docker.com/community-edition#/download

<br />

#### 2. Build container using basic [Dockerfile](https://github.com/chap/sinatra-on-heroku-via-docker/blob/master/Dockerfile)
`$ docker build -t friendlyname .`

<br />

#### 3. Run container locally, mapping container's port 4567 to localhost:4000

`$ docker run -p 4000:4567 friendlyname`

<br />


#### 4. Test locally

http://localhost:4000

<br />


#### 5. Create Heroku app

`$ heroku create`

<br />


#### 6. Login to Heroku's container registry

`$ heroku container:login`

<br />


#### 7. Push to Heroku's container registry

`$ heroku container:push web`

<br />


#### 8. View on Heroku

`$ heroku open`

<br />


#### More info

https://devcenter.heroku.com/articles/container-registry-and-runtime
